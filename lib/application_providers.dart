import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/forecast/application/location/location_cubit.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';
import 'package:weather_app/features/forecast/application/weather/weather_theme_cubit.dart';
import 'package:weather_app/features/settings/application/app_settings_cubit.dart';
import 'package:weather_app/services.dart';

class ApplicationProviders extends StatelessWidget {
  const ApplicationProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppSettingsCubit>()..load(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<LocationCubit>()..getLastLocation(),
        ),
        BlocProvider(
          create: (context) => getIt<WeatherForecastCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<WeatherThemeCubit>(),
        ),
      ],
      child: child,
    );
  }
}
