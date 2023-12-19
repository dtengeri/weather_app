import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/core/presentation/temperature_text.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
      builder: (context, state) {
        return switch (state) {
          WeatherForecastInitial() => const SizedBox(),
          WeatherForecastLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          WeatherForecastError() => Center(
              child: Text(context.l10n.failedToLoadWeahter),
            ),
          WeatherForecastLoaded(:final weatherForecast) => _CurrentWeather(
              weatherForecast: weatherForecast,
            ),
        };
      },
    );
  }
}

class _CurrentWeather extends StatelessWidget {
  const _CurrentWeather({
    super.key,
    required this.weatherForecast,
  });

  final WeatherForecast weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            weatherForecast.currentWeatherCondition.weatherCode.icon,
            size: 100,
          ),
          TemperatureText(
            temperature: weatherForecast.currentWeatherCondition.temperature,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            weatherForecast.currentWeatherCondition.weatherCode
                .toLocaleString(context),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
