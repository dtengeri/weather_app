part of 'weather_theme_cubit.dart';

@freezed
class WeatherThemeState with _$WeatherThemeState {
  const factory WeatherThemeState({
    required ThemeData currentLightTheme,
    required ThemeData currentDarkTheme,
  }) = _WeatherThemeState;
}
