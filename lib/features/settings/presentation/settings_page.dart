import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/forecast/domain/temperature_unit.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page.dart';
import 'package:weather_app/features/settings/application/app_settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static String path = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(ForecastPage.path),
        ),
      ),
      body: ListView(
        children: const [
          _TemperatureUnitConfiguration(),
        ],
      ),
    );
  }
}

class _TemperatureUnitConfiguration extends StatelessWidget {
  const _TemperatureUnitConfiguration({super.key});

  Future<void> _updateTemperatureUnit(
    BuildContext context,
    TemperatureUnit temperatureUnit,
  ) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    await context.read<AppSettingsCubit>().update(
          context.read<AppSettingsCubit>().state.appSettings.copyWith(
                temperatureUnit: temperatureUnit,
              ),
        );
    scaffoldMessenger
        .showSnackBar(SnackBar(content: Text(context.l10n.appSettingsUpdated)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        return ListTile(
          title: Text(context.l10n.temperatureUnit),
          trailing: SegmentedButton<TemperatureUnit>(
            selected: {
              state.appSettings.temperatureUnit,
            },
            onSelectionChanged: (selection) {
              _updateTemperatureUnit(context, selection.first);
            },
            segments: [
              ButtonSegment<TemperatureUnit>(
                value: TemperatureUnit.celsius,
                label: Text(context.l10n.celsius),
              ),
              ButtonSegment<TemperatureUnit>(
                value: TemperatureUnit.fahrenheit,
                label: Text(context.l10n.fahrenheit),
              ),
            ],
          ),
        );
      },
    );
  }
}
