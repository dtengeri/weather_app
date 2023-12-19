import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/forecast/domain/current_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/weather/open_meteo_remote_weather_forecast_datasource.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  final remoteDatasource = OpenMeteoRemoteWeatherForecastDatasource(dio: dio);
  const location = Location(
    city: 'Berlin',
    country: 'Germany',
    latitude: 52.52,
    longitude: 13.41,
  );
  group('OpenMeteoRemoteWeatherForecastDatasource', () {
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

      test('returns weather forecast details', () async {
        withClock(Clock.fixed(DateTime.parse('2023-12-19')), () async {
          final weatherForecastOrFailure =
              await remoteDatasource.getWeatherForecast(location);
          expect(weatherForecastOrFailure.isRight(), true);
          if (weatherForecastOrFailure case Right(:final value)) {
            expect(
              value,
              WeatherForecast(
                location: location,
                requestedAt: clock.now(),
                currentWeatherCondition: CurrentWeatherCondition(
                  humidity: 89,
                  temperature: const Temperature(
                      unit: TemperatureUnit.celsius, value: 6.3),
                  weatherCode: WeatherCode.fromCode(
                    61,
                  ),
                ),
                dailyForecast: [
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-19'),
                    minimumTemperature: const Temperature(
                        value: 5.7, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 6.9, unit: TemperatureUnit.celsius),
                    precipitation: 4.70,
                    precipitationProbability: 100,
                    weatherCode: WeatherCode.fromCode(61),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-20'),
                    minimumTemperature: const Temperature(
                        value: 4.8, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 6.5, unit: TemperatureUnit.celsius),
                    precipitation: 7.50,
                    precipitationProbability: 100,
                    weatherCode: WeatherCode.fromCode(80),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-21'),
                    minimumTemperature: const Temperature(
                        value: 5.3, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 9.2, unit: TemperatureUnit.celsius),
                    precipitation: 18.30,
                    precipitationProbability: 100,
                    weatherCode: WeatherCode.fromCode(80),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-22'),
                    minimumTemperature: const Temperature(
                        value: 0.9, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 5.0, unit: TemperatureUnit.celsius),
                    precipitation: 4.80,
                    precipitationProbability: 84,
                    weatherCode: WeatherCode.fromCode(86),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-23'),
                    minimumTemperature: const Temperature(
                        value: 1.1, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 4.6, unit: TemperatureUnit.celsius),
                    precipitation: 6.20,
                    precipitationProbability: 79,
                    weatherCode: WeatherCode.fromCode(85),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-24'),
                    minimumTemperature: const Temperature(
                        value: 2.4, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 11.1, unit: TemperatureUnit.celsius),
                    precipitation: 11.30,
                    precipitationProbability: 90,
                    weatherCode: WeatherCode.fromCode(61),
                  ),
                  DailyWeatherCondition(
                    date: DateTime.parse('2023-12-25'),
                    minimumTemperature: const Temperature(
                        value: 5.2, unit: TemperatureUnit.celsius),
                    maximumTemperature: const Temperature(
                        value: 11.2, unit: TemperatureUnit.celsius),
                    precipitation: 1.50,
                    precipitationProbability: 48,
                    weatherCode: WeatherCode.fromCode(61),
                  ),
                ],
              ),
            );
          }
        });
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
        final weatherForecastOrFailure =
            await remoteDatasource.getWeatherForecast(location);
        expect(weatherForecastOrFailure.isLeft(), true);
      });
    });
  });
}

const _requestUrl =
    'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relative_humidity_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum,precipitation_probability_max';

final _jsonData = {
  "latitude": 52.52,
  "longitude": 13.419998,
  "generationtime_ms": 0.1729726791381836,
  "utc_offset_seconds": 0,
  "timezone": "GMT",
  "timezone_abbreviation": "GMT",
  "elevation": 38.0,
  "current_units": {
    "time": "iso8601",
    "interval": "seconds",
    "temperature_2m": "°C",
    "relative_humidity_2m": "%",
    "weather_code": "wmo code"
  },
  "current": {
    "time": "2023-12-19T13:30",
    "interval": 900,
    "temperature_2m": 6.3,
    "relative_humidity_2m": 89,
    "weather_code": 61
  },
  "daily_units": {
    "time": "iso8601",
    "weather_code": "wmo code",
    "temperature_2m_max": "°C",
    "temperature_2m_min": "°C",
    "precipitation_sum": "mm",
    "precipitation_probability_max": "%"
  },
  "daily": {
    "time": [
      "2023-12-19",
      "2023-12-20",
      "2023-12-21",
      "2023-12-22",
      "2023-12-23",
      "2023-12-24",
      "2023-12-25"
    ],
    "weather_code": [61, 80, 80, 86, 85, 61, 61],
    "temperature_2m_max": [6.9, 6.5, 9.2, 5.0, 4.6, 11.1, 11.2],
    "temperature_2m_min": [5.7, 4.8, 5.3, 0.9, 1.1, 2.4, 5.2],
    "precipitation_sum": [4.70, 7.50, 18.30, 4.80, 6.20, 11.30, 1.50],
    "precipitation_probability_max": [100, 100, 100, 84, 79, 90, 48]
  }
};
