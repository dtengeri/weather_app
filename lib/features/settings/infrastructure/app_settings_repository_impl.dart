import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/settings/domain/app_settings.dart';
import 'package:weather_app/features/settings/domain/app_settings_failure.dart';
import 'package:weather_app/features/settings/domain/app_settings_repository.dart';
import 'package:weather_app/features/settings/infrastructure/datasource/local/local_app_settings_datasource.dart';

@Injectable(as: AppSettingsRepository)
class AppSettingsRepositoryImpl extends AppSettingsRepository {
  AppSettingsRepositoryImpl({
    required this.localAppSettingsDatasource,
  });

  final LocalAppSettingsDatasource localAppSettingsDatasource;

  @override
  Future<Either<AppSettingsFailure, AppSettings>> getAppSettings() {
    return localAppSettingsDatasource.getAppSettings();
  }

  @override
  Future<Either<AppSettingsFailure, AppSettings>> updateAppSettings(
      AppSettings appSettings) {
    return localAppSettingsDatasource.updateAppSettings(appSettings);
  }
}
