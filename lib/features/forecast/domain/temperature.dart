import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';

part 'temperature.freezed.dart';

@freezed
class Temperature with _$Temperature {
  const Temperature._();
  const factory Temperature({
    required double value,
    required TemperatureUnit unit,
  }) = _Temperature;

  double toCelsius() {
    return switch (unit) {
      TemperatureUnit.celsius => value,
      TemperatureUnit.fahrenheit => (value - 32) * 5 / 9,
    };
  }

  double toFahrenheit() {
    return switch (unit) {
      TemperatureUnit.celsius => value * 9 / 5 + 32,
      TemperatureUnit.fahrenheit => value,
    };
  }
}
