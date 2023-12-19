import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';

abstract class LocalLocationDatasource {
  Future<Either<LocationNotFoundFailure, Location>> getLastLocation();
  Future<Either<LocationSaveFailure, Location>> saveLocation(Location location);
}
