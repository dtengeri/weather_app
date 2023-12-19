import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';

abstract class WeatherRepository {
  Stream<Either<WeatherFailure, WeatherForecast>> watchWeatherForecast(
    Location location,
  );
}
