import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:weather_app/features/core/infrastructure/object_box.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/settings/domain/app_settings.dart';
import 'package:weather_app/features/settings/domain/app_settings_failure.dart';
import 'package:weather_app/features/settings/infrastructure/datasource/local/local_app_settings_datasource.dart';
import 'package:weather_app/features/settings/infrastructure/datasource/local/object_box_app_settings.dart';
import 'package:weather_app/objectbox.g.dart';

@Injectable(as: LocalAppSettingsDatasource)
class ObjectBoxLocalAppSettingsDataSource extends LocalAppSettingsDatasource {
  ObjectBoxLocalAppSettingsDataSource({
    required ObjectBox objectBox,
  }) : _appSettingsBox = objectBox.store.box<ObjectBoxAppSettings>();

  final Box<ObjectBoxAppSettings> _appSettingsBox;
  final Logger _logger = Logger('ObjectBoxLocalAppSettingsDataSource');

  @override
  Future<Either<AppSettingsFailure, AppSettings>> getAppSettings() async {
    try {
      _logger.finest('getAppSettings()');
      final objectBoxAppSettings =
          await _appSettingsBox.query().build().findFirstAsync();
      if (objectBoxAppSettings == null) {
        _logger.finest('getAppSettings() - returning default AppSettings()');
        return right(const AppSettings());
      }
      _logger.finest(
          'getAppSettings() - returning AppSettings $objectBoxAppSettings');
      return right(
        AppSettings(
          temperatureUnit:
              objectBoxAppSettings.temperatureUnit ?? TemperatureUnit.celsius,
        ),
      );
    } catch (e) {
      return right(const AppSettings());
    }
  }

  @override
  Future<Either<AppSettingsFailure, AppSettings>> updateAppSettings(
      AppSettings appSettings) async {
    try {
      final objectBoxAppSettings =
          await _appSettingsBox.query().build().findFirstAsync() ??
              ObjectBoxAppSettings();
      objectBoxAppSettings.temperatureUnit = appSettings.temperatureUnit;
      await _appSettingsBox.putAsync(objectBoxAppSettings);
      return right(appSettings);
    } catch (e) {
      return left(AppSettingsSaveFailure());
    }
  }
}
