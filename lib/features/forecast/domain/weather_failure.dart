import 'package:weather_app/features/core/domain/failure.dart';

sealed class WeatherFailure extends Failure {}

class FailedToLoadWeatherForecast extends WeatherFailure {}

class FailedToSaveWeatherForecast extends WeatherFailure {}
