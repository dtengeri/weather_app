import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/core/presentation/temperature_text.dart';
import 'package:weather_app/features/forecast/application/weather/weather_forecast_cubit.dart';
import 'package:weather_app/features/forecast/application/weather/weather_theme_cubit.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page.dart';

class DailyforecastPage extends StatelessWidget {
  const DailyforecastPage({
    super.key,
    required this.dayIndex,
  });

  static String path = 'daily/:dayIndex';

  static String pathFor(int dayIndex) => '${ForecastPage.path}/daily/$dayIndex';

  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    final weatherForecast = context
        .select<WeatherForecastCubit, WeatherForecast?>((weatherForecastCubit) {
      if (weatherForecastCubit.state
          case WeatherForecastLoaded(:final weatherForecast)) {
        if (dayIndex > weatherForecast.dailyForecast.length - 1) {
          return null;
        }
        return weatherForecast;
      }
      return null;
    });
    if (weatherForecast == null) {
      return const SizedBox();
    }
    return _DailyForecastPage(
      location: weatherForecast.location,
      dailyWeatherCondition: weatherForecast.dailyForecast[dayIndex],
    );
  }
}

class _DailyForecastPage extends StatefulWidget {
  const _DailyForecastPage({
    super.key,
    required this.location,
    required this.dailyWeatherCondition,
  });

  final Location location;
  final DailyWeatherCondition dailyWeatherCondition;

  @override
  State<_DailyForecastPage> createState() => _DailyForecastPageState();
}

class _DailyForecastPageState extends State<_DailyForecastPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<WeatherThemeCubit>()
        .updateTheme(widget.dailyWeatherCondition.weatherCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(DateFormat.yMMMd().format(widget.dailyWeatherCondition.date)),
      ),
      body: Column(
        children: [
          _City(location: widget.location),
          _WeatherIcon(dailyWeatherCondition: widget.dailyWeatherCondition),
          const SizedBox(height: 16.0),
          _Temperatures(dailyWeatherCondition: widget.dailyWeatherCondition),
          const SizedBox(height: 16.0),
          _Precipitation(dailyWeatherCondition: widget.dailyWeatherCondition)
        ],
      ),
    );
  }
}

class _Precipitation extends StatelessWidget {
  const _Precipitation({
    super.key,
    required this.dailyWeatherCondition,
  });

  final DailyWeatherCondition dailyWeatherCondition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                context.l10n.precipitation,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${dailyWeatherCondition.precipitation.toString()} mm',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                context.l10n.precipitationProbability,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${dailyWeatherCondition.precipitationProbability.toString()} %',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Temperatures extends StatelessWidget {
  const _Temperatures({
    super.key,
    required this.dailyWeatherCondition,
  });

  final DailyWeatherCondition dailyWeatherCondition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                context.l10n.minTemperature,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TemperatureText(
                temperature: dailyWeatherCondition.minimumTemperature,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                context.l10n.maxTemperature,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TemperatureText(
                temperature: dailyWeatherCondition.maximumTemperature,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({
    super.key,
    required this.dailyWeatherCondition,
  });

  final DailyWeatherCondition dailyWeatherCondition;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: dailyWeatherCondition,
            child: Icon(
              dailyWeatherCondition.weatherCode.icon,
              size: 100,
            ),
          ),
          Text(
            dailyWeatherCondition.weatherCode.toLocaleString(context),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class _City extends StatelessWidget {
  const _City({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        location.city,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
