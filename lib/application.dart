import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'package:weather_app/application_providers.dart';
import 'package:weather_app/features/forecast/application/weather/weather_theme_cubit.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/services.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Future<void>? _appLoader;
  final Logger _logger = Logger('Application');

  void _initializeLogging() {
    Logger.root.level = kDebugMode ? Level.ALL : Level.OFF;
  }

  void _initializeErrorHandlers() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      _logger.severe('Application error', details.exception, details.stack);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      _logger.severe('Application error', error, stack);
      return true;
    };
  }

  Future<void> _initialize() async {
    _initializeLogging();
    _initializeErrorHandlers();
    await configureDependencies();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLoader ??= _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _appLoader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const _InitializedApplication();
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class _InitializedApplication extends StatelessWidget {
  const _InitializedApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProviders(
      child: BlocBuilder<WeatherThemeCubit, WeatherThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            theme: state.currentLightTheme,
            darkTheme: state.currentDarkTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, widget) {
              Widget error = const Text('Unrecoverable error happened.');
              if (widget is Scaffold || widget is Navigator) {
                error = Scaffold(body: Center(child: error));
              }
              ErrorWidget.builder = (errorDetails) => error;
              if (widget != null) return widget;
              throw StateError('widget is null');
            },
          );
        },
      ),
    );
  }
}
