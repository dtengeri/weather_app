import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/core/presentation/temperature_text.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/presentation/daily_forecast_page.dart';

class DailyWeatherForecast extends StatelessWidget {
  const DailyWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
      builder: (context, state) {
        return switch (state) {
          WeatherForecastLoaded(:final weatherForecast) => _DailyForecast(
              dailyForecasts: weatherForecast.dailyForecast,
            ),
          _ => const SizedBox(),
        };
      },
    );
  }
}

class _DailyForecast extends StatelessWidget {
  const _DailyForecast({
    super.key,
    required this.dailyForecasts,
  });

  final List<DailyWeatherCondition> dailyForecasts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListView.separated(
            itemCount: dailyForecasts.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return _DailyWeatherForecastItem(
                dailyWeatherCondition: dailyForecasts[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class _DailyWeatherForecastItem extends StatelessWidget {
  const _DailyWeatherForecastItem({
    super.key,
    required this.dailyWeatherCondition,
    required this.index,
  });

  final DailyWeatherCondition dailyWeatherCondition;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.go(DailyforecastPage.pathFor(index));
      },
      title: Text(DateFormat.yMd().format(dailyWeatherCondition.date)),
      leading: Hero(
        tag: dailyWeatherCondition,
        child: Icon(
          dailyWeatherCondition.weatherCode.icon,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemperatureText(
              temperature: dailyWeatherCondition.minimumTemperature),
          const Text(' - '),
          TemperatureText(
              temperature: dailyWeatherCondition.maximumTemperature),
        ],
      ),
    );
  }
}
