import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:time/time.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/domain/weather_repository.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/weather/local_weather_forecast_datasource.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/remote/weather/remote_weather_forecast_datasource.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteWeatherForecastDatasource,
    required this.localWeatherForecastDataSource,
  });
  final RemoteWeatherForecastDatasource remoteWeatherForecastDatasource;
  final LocalWeatherForecastDataSource localWeatherForecastDataSource;

  final Logger _logger = Logger('WeatherRepositoryImpl');

  @override
  Stream<Either<WeatherFailure, WeatherForecast>> watchWeatherForecast(
    Location location,
  ) async* {
    final localWeatherForecastOrEither =
        await localWeatherForecastDataSource.getWeatherForecast(location);

    if (localWeatherForecastOrEither case Right(value: final weatherForecast)) {
      if (weatherForecast.requestedAt.isAtSameDayAs(DateTime.now())) {
        yield right(weatherForecast);
        if (weatherForecast.requestedAt.isAfter(DateTime.now() - 15.minutes)) {
          _logger.info(
            'Weather forecast is loaded from cache.',
          );
          return;
        }
      }
    }
    final remoteWeatherForecastOrEither =
        await remoteWeatherForecastDatasource.getWeatherForecast(location);
    if (remoteWeatherForecastOrEither
        case Right(value: final weatherForecast)) {
      yield right(weatherForecast);
      await localWeatherForecastDataSource.saveWeatherForecast(weatherForecast);
    }
  }
}
