import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:weather_app/features/forecast/domain/current_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/weather/remote_weather_forecast_datasource.dart';

@Injectable(as: RemoteWeatherForecastDatasource)
class OpenMeteoRemoteWeatherForecastDatasource
    extends RemoteWeatherForecastDatasource {
  OpenMeteoRemoteWeatherForecastDatasource({
    required this.dio,
  });
  final Dio dio;

  final Logger _logger = Logger('OpenMeteoRemoteWeatherForecastDatasource');

  @override
  Future<Either<WeatherFailure, WeatherForecast>> getWeatherForecast(
      Location location) async {
    try {
      final requestUrl = _buildUrl(location);
      _logger.finest('Requesting weather forecast from $requestUrl');
      final response = await dio.get(requestUrl);
      if (response.statusCode != 200) {
        _logger.finest(
            'Requesting weather forecast from $requestUrl failed with status code ${response.statusCode}');
        return left(FailedToLoadWeatherForecast());
      }

      final weatherForecast = WeatherForecast(
        location: location,
        requestedAt: clock.now(),
        currentWeatherCondition: _processCurrentWeather(response.data),
        dailyForecast: _processDailyWeather(response.data),
      );
      _logger.finest('Weather forecast $weatherForecast');
      return right(weatherForecast);
    } catch (e) {
      return left(FailedToLoadWeatherForecast());
    }
  }

  String _buildUrl(Location location) {
    return 'https://api.open-meteo.com/v1/forecast?latitude=${location.latitude}&longitude=${location.longitude}&current=temperature_2m,relative_humidity_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum,precipitation_probability_max';
  }

  CurrentWeatherCondition _processCurrentWeather(Map<String, dynamic> data) {
    return CurrentWeatherCondition(
      temperature: Temperature(
        value: data['current']['temperature_2m'],
        unit: TemperatureUnit.celsius,
      ),
      humidity: data['current']['relative_humidity_2m'],
      weatherCode: WeatherCode.fromCode(
        data['current']['weather_code'],
      ),
    );
  }

  List<DailyWeatherCondition> _processDailyWeather(Map<String, dynamic> data) {
    final time = data['daily']['time'];
    final weatherCodes = data['daily']['weather_code'];
    final temperatureMax = data['daily']['temperature_2m_max'];
    final temperatureMin = data['daily']['temperature_2m_min'];
    final percipitationSum = data['daily']['precipitation_sum'];
    final percipitationProbabilityMax =
        data['daily']['precipitation_probability_max'];

    final conditions = <DailyWeatherCondition>[];
    for (var i = 0; i < time.length; i++) {
      conditions.add(
        DailyWeatherCondition(
          date: DateTime.parse(time[i]),
          minimumTemperature: Temperature(
            value: temperatureMin[i],
            unit: TemperatureUnit.celsius,
          ),
          maximumTemperature: Temperature(
            value: temperatureMax[i],
            unit: TemperatureUnit.celsius,
          ),
          precipitation: percipitationSum[i],
          precipitationProbability: percipitationProbabilityMax[i],
          weatherCode: WeatherCode.fromCode(weatherCodes[i]),
        ),
      );
    }

    return conditions;
  }
}
