enum TemperatureUnit {
  celsius,
  fahrenheit;

  @override
  String toString() {
    return switch (this) {
      TemperatureUnit.celsius => '°C',
      TemperatureUnit.fahrenheit => '°F',
    };
  }
}
