import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/settings/domain/app_settings.dart';
import 'package:weather_app/features/settings/domain/app_settings_repository.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_state.dart';

@injectable
class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit({
    required this.appSettingsRepository,
  }) : super(AppSettingsState.initial());

  final AppSettingsRepository appSettingsRepository;

  Future<void> load() async {
    final appSettingsOrFailure = await appSettingsRepository.getAppSettings();
    appSettingsOrFailure.fold(
      (failure) => emit(state),
      (appSettings) => emit(
        state.copyWith(
          appSettings: appSettings,
        ),
      ),
    );
  }

  Future<void> update(AppSettings appSettings) async {
    final appSettingsOrFailure =
        await appSettingsRepository.updateAppSettings(appSettings);
    appSettingsOrFailure.fold(
      (failure) => emit(state),
      (appSettings) => emit(
        state.copyWith(
          appSettings: appSettings,
        ),
      ),
    );
  }
}
