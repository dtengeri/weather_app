import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';

abstract class LocalWeatherForecastDataSource {
  Future<Either<WeatherFailure, WeatherForecast>> getWeatherForecast(
    Location location,
  );
  Future<Either<WeatherFailure, WeatherForecast>> saveWeatherForecast(
    WeatherForecast weatherForecast,
  );
}
