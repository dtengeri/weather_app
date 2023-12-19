import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/core/presentation/shader_effect.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';

class WeatherEffect extends StatelessWidget {
  const WeatherEffect({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shaderAsset =
        context.select<WeatherForecastCubit, String?>((weatherForecastCubit) {
      if (weatherForecastCubit.state
          case WeatherForecastLoaded(:final weatherForecast)) {
        return weatherForecast.currentWeatherCondition.weatherCode.shaderAsset;
      }
      return null;
    });
    if (shaderAsset == null) {
      return child;
    }
    return ShaderEffect(
      shaderAsset: shaderAsset,
      child: child,
    );
  }
}
