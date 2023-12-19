import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/location/open_meteo_remote_location_datasource.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  final remoteLocationDataSource = OpenMeteoRemoteLocationDatasource(dio: dio);
  group('RemoteLocationDatasource', () {
    group('when response is ok', () {
      setUp(() {
        when(
          () => dio.get(_requestUrl),
        ).thenAnswer(
          (_) async {
            return Response(
              requestOptions: RequestOptions(),
              data: _jsonData,
              statusCode: 200,
            );
          },
        );
      });

      test('returns location details', () async {
        final locationsOrFailure = await remoteLocationDataSource.getLocations(
          cityName: 'Berlin',
        );
        expect(locationsOrFailure.isRight(), true);
        final locations = locationsOrFailure.getOrElse((_) => []);
        expect(locations.length, 10);
        expect(locations[0].city, 'Berlin');
        expect(locations[0].country, 'Germany');
        expect(locations[0].latitude, 52.52437);
        expect(locations[0].longitude, 13.41053);
      });
    });

    group('when response status is not 200', () {
      setUp(() {
        when(
          () => dio.get(_requestUrl),
        ).thenAnswer(
          (_) async {
            return Response(
              requestOptions: RequestOptions(),
              data: _jsonData,
              statusCode: 404,
            );
          },
        );
      });

      test('returns failure', () async {
        final locationsOrFailure = await remoteLocationDataSource.getLocations(
          cityName: 'Berlin',
        );
        expect(locationsOrFailure.isLeft(), true);
      });
    });
  });
}

const _requestUrl =
    'https://geocoding-api.open-meteo.com/v1/search?name=Berlin&count=10&language=en&format=json';

final _jsonData = {
  "results": [
    {
      "id": 2950159,
      "name": "Berlin",
      "latitude": 52.52437,
      "longitude": 13.41053,
      "elevation": 74.0,
      "feature_code": "PPLC",
      "country_code": "DE",
      "admin1_id": 2950157,
      "admin3_id": 6547383,
      "admin4_id": 6547539,
      "timezone": "Europe/Berlin",
      "population": 3426354,
      "postcodes": ["10967", "13347"],
      "country_id": 2921044,
      "country": "Germany",
      "admin1": "Land Berlin",
      "admin3": "Berlin, Stadt",
      "admin4": "Berlin"
    },
    {
      "id": 5083330,
      "name": "Berlin",
      "latitude": 44.46867,
      "longitude": -71.18508,
      "elevation": 311.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 5090174,
      "admin2_id": 5084973,
      "admin3_id": 5083340,
      "timezone": "America/New_York",
      "population": 9367,
      "postcodes": ["03570"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "New Hampshire",
      "admin2": "Coos",
      "admin3": "City of Berlin"
    },
    {
      "id": 4500771,
      "name": "Berlin",
      "latitude": 39.79123,
      "longitude": -74.92905,
      "elevation": 50.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 5101760,
      "admin2_id": 4501019,
      "admin3_id": 4500776,
      "timezone": "America/New_York",
      "population": 7590,
      "postcodes": ["08009"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "New Jersey",
      "admin2": "Camden",
      "admin3": "Borough of Berlin"
    },
    {
      "id": 5245497,
      "name": "Berlin",
      "latitude": 43.96804,
      "longitude": -88.94345,
      "elevation": 246.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 5279468,
      "admin2_id": 5255015,
      "admin3_id": 5245510,
      "timezone": "America/Chicago",
      "population": 5420,
      "postcodes": ["54923"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Wisconsin",
      "admin2": "Green Lake",
      "admin3": "City of Berlin"
    },
    {
      "id": 4348460,
      "name": "Berlin",
      "latitude": 38.32262,
      "longitude": -75.21769,
      "elevation": 11.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 4361885,
      "admin2_id": 4374180,
      "timezone": "America/New_York",
      "population": 4529,
      "postcodes": ["21811"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Maryland",
      "admin2": "Worcester"
    },
    {
      "id": 4930431,
      "name": "Berlin",
      "latitude": 42.3812,
      "longitude": -71.63701,
      "elevation": 100.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 6254926,
      "admin2_id": 4956199,
      "admin3_id": 4930436,
      "timezone": "America/New_York",
      "population": 2422,
      "postcodes": ["01503"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Massachusetts",
      "admin2": "Worcester",
      "admin3": "Town of Berlin"
    },
    {
      "id": 4556518,
      "name": "Berlin",
      "latitude": 39.92064,
      "longitude": -78.9578,
      "elevation": 710.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 6254927,
      "admin2_id": 5212857,
      "admin3_id": 4556520,
      "timezone": "America/New_York",
      "population": 2019,
      "postcodes": ["15530"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Pennsylvania",
      "admin2": "Somerset",
      "admin3": "Borough of Berlin"
    },
    {
      "id": 4557666,
      "name": "East Berlin",
      "latitude": 39.9376,
      "longitude": -76.97859,
      "elevation": 131.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 6254927,
      "admin2_id": 4556228,
      "admin3_id": 4557667,
      "timezone": "America/New_York",
      "population": 1534,
      "postcodes": ["17316"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Pennsylvania",
      "admin2": "Adams",
      "admin3": "Borough of East Berlin"
    },
    {
      "id": 5147132,
      "name": "Berlin",
      "latitude": 40.56117,
      "longitude": -81.7943,
      "elevation": 391.0,
      "feature_code": "PPL",
      "country_code": "US",
      "admin1_id": 5165418,
      "admin2_id": 5157783,
      "admin3_id": 5147154,
      "timezone": "America/New_York",
      "population": 898,
      "postcodes": ["44610"],
      "country_id": 6252001,
      "country": "United States",
      "admin1": "Ohio",
      "admin2": "Holmes",
      "admin3": "Berlin Township"
    },
    {
      "id": 1510159,
      "name": "Berlin",
      "latitude": 54.00603,
      "longitude": 61.19308,
      "elevation": 228.0,
      "feature_code": "PPL",
      "country_code": "RU",
      "admin1_id": 1508290,
      "admin2_id": 1489213,
      "timezone": "Asia/Yekaterinburg",
      "population": 613,
      "postcodes": ["457130"],
      "country_id": 2017370,
      "country": "Russia",
      "admin1": "Chelyabinsk",
      "admin2": "Troitskiy Rayon"
    }
  ],
  "generationtime_ms": 1.429081
};
