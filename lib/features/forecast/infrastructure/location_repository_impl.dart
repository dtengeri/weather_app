import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';
import 'package:weather_app/features/forecast/domain/location_repository.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/location/local_location_datasource.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/location/remote_location_datasource.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl({
    required this.localLocationDatasource,
    required this.remoteLocationDatasource,
  });

  final LocalLocationDatasource localLocationDatasource;
  final RemoteLocationDatasource remoteLocationDatasource;
  @override
  Future<Either<LocationNotFoundFailure, Location>> getLastLocation() {
    return localLocationDatasource.getLastLocation();
  }

  @override
  Future<Either<LocationSaveFailure, Location>> saveLastLocation(
    Location location,
  ) {
    return localLocationDatasource.saveLocation(location);
  }

  @override
  Future<Either<LocationNotFoundFailure, List<Location>>> getLocations({
    required String cityName,
  }) {
    return remoteLocationDatasource.getLocations(cityName: cityName);
  }
}
