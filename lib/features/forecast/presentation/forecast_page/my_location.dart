import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/forecast/application/location/location_cubit.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/presentation/forecast_page/search_location_dialog.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.myLocation,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LocationName(),
            _ChangeLocationButton(),
          ],
        )
      ],
    );
  }
}

class _LocationName extends StatelessWidget {
  const _LocationName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
      return switch (state) {
        UnknownLocation() => const Text('- -'),
        LoadingLocation() => const CircularProgressIndicator(),
        LocationError() => const Text('- -'),
        LastLocation(:final location) => Text(
            '${location.city}, ${location.country}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
      };
    });
  }
}

class _ChangeLocationButton extends StatelessWidget {
  const _ChangeLocationButton({super.key});

  Future<void> _changeLocation(BuildContext context) async {
    final locationCubit = context.read<LocationCubit>();
    final location = await showDialog<Location>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: locationCubit,
        child: const SearchLocationDialog(),
      ),
    );
    if (location != null) {
      locationCubit.changeLocation(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeLocation(context),
      icon: const Icon(Icons.edit),
    );
  }
}
