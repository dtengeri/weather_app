import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';

part 'current_weather_condition.freezed.dart';

@freezed
class CurrentWeatherCondition with _$CurrentWeatherCondition {
  const factory CurrentWeatherCondition({
    required Temperature temperature,
    required int humidity,
    required WeatherCode weatherCode,
  }) = _CurrentWeatherCondition;
}
