import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/core/presentation/themes.dart';
import 'package:weather_app/features/forecast/domain/weather_code.dart';

part 'weather_theme_cubit.freezed.dart';
part 'weather_theme_state.dart';

@injectable
class WeatherThemeCubit extends Cubit<WeatherThemeState> {
  WeatherThemeCubit()
      : super(
          WeatherThemeState(
            currentLightTheme: sunnyLightTheme,
            currentDarkTheme: sunnyDarkTheme,
          ),
        );

  void updateTheme(WeatherCode weatherCode) {
    emit(
      WeatherThemeState(
        currentLightTheme: weatherCode.theme.light,
        currentDarkTheme: weatherCode.theme.dark,
      ),
    );
  }
}
