part of 'weather_forecast_cubit.dart';

sealed class WeatherForecastState {}

class WeatherForecastInitial extends WeatherForecastState {}

class WeatherForecastLoading extends WeatherForecastState {}

class WeatherForecastLoaded extends WeatherForecastState {
  WeatherForecastLoaded({
    required this.weatherForecast,
  });
  final WeatherForecast weatherForecast;
}

class WeatherForecastError extends WeatherForecastState {
  WeatherForecastError({
    required this.failure,
  });
  final WeatherFailure failure;
}
