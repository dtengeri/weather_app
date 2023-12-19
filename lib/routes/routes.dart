import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/forecast/presentation/daily_forecast_page.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page.dart';
import 'package:weather_app/features/settings/presentation/settings_page.dart';
import 'package:weather_app/features/splash/presentation/splash_page.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: ForecastPage.path,
  routes: [
    GoRoute(
      path: SplashPage.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: ForecastPage.path,
      builder: (context, state) => const ForecastPage(),
      routes: [
        GoRoute(
          path: DailyforecastPage.path,
          builder: (context, state) => DailyforecastPage(
            dayIndex: int.tryParse(state.pathParameters['dayIndex']!) ?? 0,
          ),
        ),
      ],
    ),
    GoRoute(
      path: SettingsPage.path,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
