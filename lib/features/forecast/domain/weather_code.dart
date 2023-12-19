import 'package:flutter/material.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/core/presentation/themes.dart';

enum WeatherCode {
  clearSky(0),
  mainlyClear(1),
  partlyCloudy(2),
  overcast(3),
  fog(45),
  depositingRimeFog(48),
  drizzleLight(51),
  drizzleModerate(53),
  drizzleDense(55),
  freezingDrizzleLight(56),
  freezingDrizzleDense(57),
  rainSlight(61),
  rainModerate(63),
  rainHeavy(65),
  freezingRainLight(66),
  freezingRainHeavy(67),
  snowFallSlight(71),
  snowFallModerate(73),
  snowFallHeavy(75),
  snowGrains(77),
  rainShowersSlight(80),
  rainShowersModerate(81),
  rainShowersViolent(82),
  snowShowersSlight(85),
  snowShowersHeavy(86),
  thunderstormSlight(95),
  thunderstormModerate(96),
  thunderstormHeavy(99);

  const WeatherCode(this.code);

  factory WeatherCode.fromCode(int code) {
    return WeatherCode.values.firstWhere((element) => element.code == code);
  }

  final int code;

  String? get shaderAsset {
    return switch (this) {
      drizzleLight ||
      drizzleModerate ||
      drizzleDense ||
      freezingDrizzleLight ||
      freezingDrizzleDense ||
      rainSlight ||
      rainModerate ||
      rainHeavy ||
      freezingRainLight ||
      freezingRainHeavy ||
      rainShowersSlight ||
      rainShowersModerate ||
      rainShowersViolent ||
      thunderstormSlight ||
      thunderstormModerate ||
      thunderstormHeavy =>
        'shaders/rain.frag',
      snowFallSlight ||
      snowFallModerate ||
      snowFallHeavy ||
      snowGrains ||
      snowShowersSlight ||
      snowShowersHeavy =>
        'shaders/snow.frag',
      clearSky ||
      mainlyClear ||
      partlyCloudy ||
      overcast ||
      fog ||
      depositingRimeFog =>
        null,
    };
  }

  IconData get icon {
    return switch (this) {
      drizzleLight ||
      drizzleModerate ||
      drizzleDense ||
      freezingDrizzleLight ||
      freezingDrizzleDense ||
      rainSlight ||
      rainModerate ||
      rainHeavy ||
      freezingRainLight ||
      freezingRainHeavy ||
      rainShowersSlight ||
      rainShowersModerate ||
      rainShowersViolent ||
      thunderstormSlight ||
      thunderstormModerate ||
      thunderstormHeavy =>
        Icons.cloud,
      snowFallSlight ||
      snowFallModerate ||
      snowFallHeavy ||
      snowGrains ||
      snowShowersSlight ||
      snowShowersHeavy =>
        Icons.snowing,
      clearSky ||
      mainlyClear ||
      partlyCloudy ||
      overcast ||
      fog ||
      depositingRimeFog =>
        Icons.sunny,
    };
  }

  ({ThemeData light, ThemeData dark}) get theme {
    return switch (this) {
      drizzleLight ||
      drizzleModerate ||
      drizzleDense ||
      freezingDrizzleLight ||
      freezingDrizzleDense ||
      rainSlight ||
      rainModerate ||
      rainHeavy ||
      freezingRainLight ||
      freezingRainHeavy ||
      rainShowersSlight ||
      rainShowersModerate ||
      rainShowersViolent ||
      thunderstormSlight ||
      thunderstormModerate ||
      thunderstormHeavy =>
        (light: rainLightTheme, dark: rainDarkTheme),
      snowFallSlight ||
      snowFallModerate ||
      snowFallHeavy ||
      snowGrains ||
      snowShowersSlight ||
      snowShowersHeavy =>
        (light: snowLightTheme, dark: snowDarkTheme),
      clearSky ||
      mainlyClear ||
      partlyCloudy ||
      overcast ||
      fog ||
      depositingRimeFog =>
        (light: sunnyLightTheme, dark: sunnyDarkTheme),
    };
  }

  String toLocaleString(BuildContext context) {
    return switch (this) {
      clearSky => context.l10n.clearSky,
      mainlyClear => context.l10n.mainlyClear,
      partlyCloudy => context.l10n.partlyCloudy,
      overcast => context.l10n.overcast,
      fog => context.l10n.fog,
      depositingRimeFog => context.l10n.depositingRimeFog,
      drizzleLight => context.l10n.drizzleLight,
      drizzleModerate => context.l10n.drizzleModerate,
      drizzleDense => context.l10n.drizzleDense,
      freezingDrizzleLight => context.l10n.freezingDrizzleLight,
      freezingDrizzleDense => context.l10n.freezingDrizzleDense,
      rainSlight => context.l10n.rainSlight,
      rainModerate => context.l10n.rainModerate,
      rainHeavy => context.l10n.rainHeavy,
      freezingRainLight => context.l10n.freezingRainLight,
      freezingRainHeavy => context.l10n.freezingRainHeavy,
      snowFallSlight => context.l10n.snowFallSlight,
      snowFallModerate => context.l10n.snowFallModerate,
      snowFallHeavy => context.l10n.snowFallHeavy,
      snowGrains => context.l10n.snowGrains,
      rainShowersSlight => context.l10n.rainShowersSlight,
      rainShowersModerate => context.l10n.rainShowersModerate,
      rainShowersViolent => context.l10n.rainShowersViolent,
      snowShowersSlight => context.l10n.snowShowersSlight,
      snowShowersHeavy => context.l10n.snowShowersHeavy,
      thunderstormSlight => context.l10n.thunderstormSlight,
      thunderstormModerate => context.l10n.thunderstormModerate,
      thunderstormHeavy => context.l10n.thunderstormHeavy,
    };
  }
}
