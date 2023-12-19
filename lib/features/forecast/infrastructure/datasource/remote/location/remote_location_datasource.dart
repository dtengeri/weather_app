import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';

abstract class RemoteLocationDatasource {
  Future<Either<LocationNotFoundFailure, List<Location>>> getLocations({
    required String cityName,
  });
}
