import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/location/remote_location_datasource.dart';

@Injectable(as: RemoteLocationDatasource)
class OpenMeteoRemoteLocationDatasource extends RemoteLocationDatasource {
  OpenMeteoRemoteLocationDatasource({
    required this.dio,
  });

  final Dio dio;
  final Logger _logger = Logger('OpenMeteoRemoteLocationDatasource');

  @override
  Future<Either<LocationNotFoundFailure, List<Location>>> getLocations({
    required String cityName,
  }) async {
    try {
      final locations = <Location>[];
      final requestUrl = _buildOpenMeteoUrl(cityName: cityName);
      _logger.finest('Requesting locations from $requestUrl');

      final response = await dio.get(requestUrl);
      if (response.statusCode != 200) {
        return left(LocationNotFoundFailure());
      }

      final locationsJson = response.data['results'];
      if (locationsJson == null) {
        return left(LocationNotFoundFailure());
      }

      for (final locationJson in locationsJson) {
        final location = Location(
          city: locationJson['name'],
          country: locationJson['country'],
          latitude: locationJson['latitude'],
          longitude: locationJson['longitude'],
        );
        locations.add(location);
      }
      return right(locations);
    } catch (e) {
      return left(LocationNotFoundFailure());
    }
  }

  String _buildOpenMeteoUrl({
    required String cityName,
  }) {
    return 'https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=10&language=en&format=json';
  }
}
