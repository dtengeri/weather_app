import 'package:objectbox/objectbox.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';

@Entity()
class ObjectBoxAppSettings {
  @Id()
  int id = 0;

  @Transient()
  TemperatureUnit? temperatureUnit;

  int? get dbTemneperatureUnit {
    _ensureStableEnumValues();
    return temperatureUnit?.index;
  }

  set dbTemneperatureUnit(int? value) {
    _ensureStableEnumValues();
    if (value == null) {
      temperatureUnit = null;
    } else {
      temperatureUnit = value >= 0 && value < TemperatureUnit.values.length
          ? TemperatureUnit.values[value]
          : TemperatureUnit.celsius;
    }
  }

  void _ensureStableEnumValues() {
    assert(TemperatureUnit.celsius.index == 0);
    assert(TemperatureUnit.fahrenheit.index == 1);
  }

  @override
  String toString() {
    return 'ObjectBoxAppSettings(id: $id, temperatureUnit: $temperatureUnit)';
  }
}
