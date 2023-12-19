import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(TemperatureUnit.celsius) TemperatureUnit temperatureUnit,
  }) = _AppSettings;
}
