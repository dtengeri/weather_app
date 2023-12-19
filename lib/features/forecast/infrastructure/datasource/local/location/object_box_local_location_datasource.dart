import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:weather_app/features/core/infrastructure/object_box.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/location/local_location_datasource.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/location/object_box_location.dart';
import 'package:weather_app/objectbox.g.dart';

@Injectable(as: LocalLocationDatasource)
class ObjectBoxLocationDatasource extends LocalLocationDatasource {
  ObjectBoxLocationDatasource({
    required ObjectBox objectBox,
  }) : _locationBox = objectBox.store.box<ObjectBoxLocation>();

  final Box<ObjectBoxLocation> _locationBox;
  final Logger _logger = Logger('ObjectBoxLocationDatasource');

  @override
  Future<Either<LocationNotFoundFailure, Location>> getLastLocation() async {
    try {
      _logger.finest('getLastLocation()');
      final objectBoxLocation =
          await _locationBox.query().build().findFirstAsync();
      if (objectBoxLocation == null) {
        _logger.finest('getLastLocation() - LocationNotFoundFailure');
        return left(LocationNotFoundFailure());
      }
      _logger
          .finest('getLastLocation() - returning Location $objectBoxLocation');
      return right(Location(
        city: objectBoxLocation.city ?? '',
        country: objectBoxLocation.country ?? '',
        latitude: objectBoxLocation.latitude ?? 0,
        longitude: objectBoxLocation.longitude ?? 0,
      ));
    } catch (e) {
      return left(LocationNotFoundFailure());
    }
  }

  @override
  Future<Either<LocationSaveFailure, Location>> saveLocation(
    Location location,
  ) async {
    try {
      final objectBoxLocation =
          await _locationBox.query().build().findFirstAsync() ??
              ObjectBoxLocation();
      objectBoxLocation.city = location.city;
      objectBoxLocation.country = location.country;
      objectBoxLocation.latitude = location.latitude;
      objectBoxLocation.longitude = location.longitude;
      await _locationBox.putAsync(objectBoxLocation);
      return right(location);
    } catch (e) {
      return left(LocationSaveFailure());
    }
  }
}
