import 'package:weather_app/features/core/domain/failure.dart';

sealed class AppSettingsFailure extends Failure {}

class AppSettingsSaveFailure extends AppSettingsFailure {}

class AppSettingsNotFoundFailure extends AppSettingsFailure {}
