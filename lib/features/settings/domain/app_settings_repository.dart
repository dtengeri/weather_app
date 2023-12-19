import 'package:fpdart/fpdart.dart';
import 'package:weather_app/features/settings/domain/app_settings.dart';
import 'package:weather_app/features/settings/domain/app_settings_failure.dart';

abstract class AppSettingsRepository {
  Future<Either<AppSettingsFailure, AppSettings>> getAppSettings();
  Future<Either<AppSettingsFailure, AppSettings>> updateAppSettings(
    AppSettings appSettings,
  );
}
