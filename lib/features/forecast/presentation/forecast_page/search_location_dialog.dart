import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/core/presentation/context_extensions.dart';
import 'package:weather_app/features/forecast/application/location/location_cubit.dart';
import 'package:weather_app/features/forecast/application/location/location_search_cubit.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/services.dart';

class SearchLocationDialog extends StatelessWidget {
  const SearchLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationSearchCubit>(),
      child: AlertDialog(
        title: Text(context.l10n.changeLocation),
        actions: const [
          _CancelButton(),
        ],
        content: const SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CityTextField(),
              Expanded(
                child: _SearchResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: Text(
        context.l10n.cancel,
      ),
    );
  }
}

class _CityTextField extends StatefulWidget {
  const _CityTextField({super.key});

  @override
  State<_CityTextField> createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<_CityTextField> {
  late final TextEditingController _cityController = TextEditingController();

  Timer? _debounce;

  void _searchCity() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), _fetchLocations);
  }

  void _fetchLocations() {
    final cityName = _cityController.text;
    if (cityName.isEmpty) {
      return;
    }
    context.read<LocationSearchCubit>().searchLocations(cityName);
  }

  @override
  void initState() {
    _debounce?.cancel();
    _cityController.addListener(_searchCity);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final locationCubit = context.read<LocationCubit>();
    if (locationCubit.state case LastLocation(:final location)) {
      _cityController.text = location.city;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state case LastLocation(:final location)) {
          _cityController.text = location.city;
        }
      },
      child: TextField(
        controller: _cityController,
        decoration: InputDecoration(
          labelText: context.l10n.city,
        ),
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationSearchCubit, LocationSearchState>(
      builder: (context, state) {
        return switch (state) {
          LocationSearchInitial() => const SizedBox.shrink(),
          LoadingLocations() =>
            const Center(child: CircularProgressIndicator()),
          LocationSearchError() =>
            Center(child: Text(context.l10n.failedToLoadLocations)),
          LocationsLoaded(:final locations) =>
            _LocationList(locations: locations),
        };
      },
    );
  }
}

class _LocationList extends StatelessWidget {
  const _LocationList({
    super.key,
    required this.locations,
  });

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(locations[index].city),
        subtitle: Text(locations[index].country),
        onTap: () {
          context.pop(locations[index]);
        },
      ),
    );
  }
}
