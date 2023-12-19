import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/domain/current_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/location.dart';

part 'weather_forecast.freezed.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    required Location location,
    required DateTime requestedAt,
    required CurrentWeatherCondition currentWeatherCondition,
    required List<DailyWeatherCondition> dailyForecast,
  }) = _WeatherForecast;
}
