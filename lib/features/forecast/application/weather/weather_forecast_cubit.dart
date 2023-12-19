import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/domain/weather_repository.dart';

part 'weather_forecast_state.dart';

@injectable
class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit({
    required this.weatherRepository,
  }) : super(WeatherForecastInitial());

  final WeatherRepository weatherRepository;

  StreamSubscription<Either<WeatherFailure, WeatherForecast>>?
      _weatherForecastStreamSubscription;

  Future<void> loadWeatherForecast(Location location) async {
    _weatherForecastStreamSubscription?.cancel();
    emit(WeatherForecastLoading());
    _weatherForecastStreamSubscription = weatherRepository
        .watchWeatherForecast(location)
        .listen(
          (weatherForecastEither) => weatherForecastEither.fold(
            (failure) => emit(WeatherForecastError(failure: failure)),
            (weatherForecast) =>
                emit(WeatherForecastLoaded(weatherForecast: weatherForecast)),
          ),
        );
  }

  @override
  Future<void> close() {
    _weatherForecastStreamSubscription?.cancel();
    return super.close();
  }
}
