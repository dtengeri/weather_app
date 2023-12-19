part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const AppSettingsState._();

  const factory AppSettingsState({
    required AppSettings appSettings,
  }) = _AppSettingsState;

  factory AppSettingsState.initial() => const AppSettingsState(
        appSettings: AppSettings(),
      );
}
