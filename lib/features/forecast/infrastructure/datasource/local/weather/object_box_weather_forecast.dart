import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxWeatherForecast {
  @Id()
  int id = 0;

  @Index()
  String? locationCity;
  @Index()
  String? locationCountry;
  double? locationLatitude;
  double? locationLongitude;

  DateTime? requestedAt;
  double? currentTemperature;
  int? currentHumidity;
  int? currentWeatherCode;

  @Backlink('weatherForecast')
  final dailyWeatherConditions = ToMany<ObjectBoxDailyWeatherCondition>();
}

@Entity()
class ObjectBoxDailyWeatherCondition {
  @Id()
  int id = 0;

  final weatherForecast = ToOne<ObjectBoxWeatherForecast>();

  DateTime? date;
  double? minimumTemperature;
  double? maximumTemperature;
  double? precipitation;
  int? precipitationProbability;
  int? weatherCode;
}
