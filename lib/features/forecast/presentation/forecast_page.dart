import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/current_weather.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/daily_weather_forecast.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/forecast_page_providers.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/my_location.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/weather_effect.dart';
import 'package:weather_app/features/settings/presentation/settings_page.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  static String path = '/forecast';

  @override
  Widget build(BuildContext context) {
    return const ForecastPageProviders(
      child: WeatherEffect(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    MyLocation(),
                    Positioned(
                      right: 0,
                      child: _SettingsButton(),
                    ),
                  ],
                ),
                CurrentWeather(),
                Expanded(child: DailyWeatherForecast()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(SettingsPage.path);
      },
      icon: const Icon(Icons.settings),
    );
  }
}
