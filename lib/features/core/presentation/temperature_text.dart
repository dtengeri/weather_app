import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/settings/application/app_settings_cubit.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    super.key,
    required this.temperature,
    this.style,
  });

  final Temperature temperature;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final temperatureUnit = context.select<AppSettingsCubit, TemperatureUnit>(
      (cubit) => cubit.state.appSettings.temperatureUnit,
    );
    return Text(
      switch (temperatureUnit) {
        TemperatureUnit.celsius =>
          '${temperature.toCelsius().toStringAsFixed(1)} °C',
        TemperatureUnit.fahrenheit =>
          '${temperature.toFahrenheit().toStringAsFixed(1)} °F',
      },
      style: style,
    );
  }
}
