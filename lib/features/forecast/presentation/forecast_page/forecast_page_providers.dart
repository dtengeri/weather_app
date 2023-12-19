import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/forecast/application/location/location_cubit.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';
import 'package:weather_app/features/forecast/application/weather/weather_theme_cubit.dart';

class ForecastPageProviders extends StatelessWidget {
  const ForecastPageProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state case LastLocation(:final location)) {
              context
                  .read<WeatherForecastCubit>()
                  .loadWeatherForecast(location);
            }
          },
        ),
        BlocListener<WeatherForecastCubit, WeatherForecastState>(
          listener: (context, state) {
            if (state case WeatherForecastLoaded(:final weatherForecast)) {
              context.read<WeatherThemeCubit>().updateTheme(
                    weatherForecast.currentWeatherCondition.weatherCode,
                  );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
