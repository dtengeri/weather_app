import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/core/infrastructure/object_box.dart';
import 'package:weather_app/features/forecast/domain/current_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/daily_weather_condition.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/temperature.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';
import 'package:weather_app/features/forecast/domain/weather_failure.dart';
import 'package:weather_app/features/forecast/domain/weather_forecast.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/weather/local_weather_forecast_datasource.dart';
import 'package:weather_app/features/forecast/infrastructure/datasource/local/weather/object_box_weather_forecast.dart';
import 'package:weather_app/objectbox.g.dart';

@Injectable(as: LocalWeatherForecastDataSource)
class ObjectBoxLocalWeatherForecastDatasource
    extends LocalWeatherForecastDataSource {
  ObjectBoxLocalWeatherForecastDatasource({
    required ObjectBox objectBox,
  }) : _weatherForecastBox = objectBox.store.box<ObjectBoxWeatherForecast>();

  final Box<ObjectBoxWeatherForecast> _weatherForecastBox;

  @override
  Future<Either<WeatherFailure, WeatherForecast>> getWeatherForecast(
    Location location,
  ) async {
    try {
      final objectBoxWeatherForecast = await _weatherForecastBox
          .query(
            ObjectBoxWeatherForecast_.locationCity.equals(location.city) &
                ObjectBoxWeatherForecast_.locationCountry
                    .equals(location.country),
          )
          .build()
          .findFirstAsync();
      if (objectBoxWeatherForecast == null) {
        return left(FailedToLoadWeatherForecast());
      }
      return right(WeatherForecast(
        location: location,
        requestedAt: objectBoxWeatherForecast.requestedAt ??
            DateTime.fromMillisecondsSinceEpoch(0),
        currentWeatherCondition: CurrentWeatherCondition(
          temperature: Temperature(
            value: objectBoxWeatherForecast.currentTemperature ?? 0.0,
            unit: TemperatureUnit.celsius,
          ),
          humidity: objectBoxWeatherForecast.currentHumidity ?? 0,
          weatherCode: WeatherCode.fromCode(
              objectBoxWeatherForecast.currentWeatherCode ?? 0),
        ),
        dailyForecast: objectBoxWeatherForecast.dailyWeatherConditions
            .map((dailyWeatherCondition) => DailyWeatherCondition(
                  date: dailyWeatherCondition.date ??
                      DateTime.fromMillisecondsSinceEpoch(0),
                  minimumTemperature: Temperature(
                    value: dailyWeatherCondition.minimumTemperature ?? 0.0,
                    unit: TemperatureUnit.celsius,
                  ),
                  maximumTemperature: Temperature(
                    value: dailyWeatherCondition.maximumTemperature ?? 0.0,
                    unit: TemperatureUnit.celsius,
                  ),
                  precipitation: dailyWeatherCondition.precipitation ?? 0.0,
                  precipitationProbability:
                      dailyWeatherCondition.precipitationProbability ?? 0,
                  weatherCode: WeatherCode.fromCode(
                      dailyWeatherCondition.weatherCode ?? 0),
                ))
            .toList(),
      ));
    } catch (e) {
      return left(FailedToLoadWeatherForecast());
    }
  }

  @override
  Future<Either<WeatherFailure, WeatherForecast>> saveWeatherForecast(
      WeatherForecast weatherForecast) async {
    try {
      final objectBoxWeatherForecast = await _weatherForecastBox
              .query(
                ObjectBoxWeatherForecast_.locationCity
                        .equals(weatherForecast.location.city) &
                    ObjectBoxWeatherForecast_.locationCountry
                        .equals(weatherForecast.location.country),
              )
              .build()
              .findFirstAsync() ??
          ObjectBoxWeatherForecast();
      objectBoxWeatherForecast.locationCity = weatherForecast.location.city;
      objectBoxWeatherForecast.locationCountry =
          weatherForecast.location.country;
      objectBoxWeatherForecast.locationLatitude =
          weatherForecast.location.latitude;
      objectBoxWeatherForecast.locationLongitude =
          weatherForecast.location.longitude;
      objectBoxWeatherForecast.requestedAt = weatherForecast.requestedAt;
      objectBoxWeatherForecast.currentTemperature =
          weatherForecast.currentWeatherCondition.temperature.value;
      objectBoxWeatherForecast.currentHumidity =
          weatherForecast.currentWeatherCondition.humidity;
      objectBoxWeatherForecast.currentWeatherCode =
          weatherForecast.currentWeatherCondition.weatherCode.code;
      objectBoxWeatherForecast.dailyWeatherConditions.clear();
      objectBoxWeatherForecast.dailyWeatherConditions.addAll(
        weatherForecast.dailyForecast.map(
          (dailyWeatherCondition) {
            final condition = ObjectBoxDailyWeatherCondition();
            condition.date = dailyWeatherCondition.date;
            condition.minimumTemperature =
                dailyWeatherCondition.minimumTemperature.value;
            condition.maximumTemperature =
                dailyWeatherCondition.maximumTemperature.value;
            condition.precipitation = dailyWeatherCondition.precipitation;
            condition.precipitationProbability =
                dailyWeatherCondition.precipitationProbability;
            condition.weatherCode = dailyWeatherCondition.weatherCode.code;

            return condition;
          },
        ).toList(),
      );
      await _weatherForecastBox.putAsync(objectBoxWeatherForecast);
      return right(weatherForecast);
    } catch (e) {
      return left(FailedToSaveWeatherForecast());
    }
  }
}
