import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';

part 'daily_weather_condition.freezed.dart';

@freezed
class DailyWeatherCondition with _$DailyWeatherCondition {
  const factory DailyWeatherCondition({
    required DateTime date,
    required Temperature minimumTemperature,
    required Temperature maximumTemperature,
    required double precipitation,
    required int precipitationProbability,
    required WeatherCode weatherCode,
  }) = _DailyWeatherCondition;
}
