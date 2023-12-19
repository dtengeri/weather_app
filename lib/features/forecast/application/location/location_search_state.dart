part of 'location_search_cubit.dart';

sealed class LocationSearchState {}

class LocationSearchInitial extends LocationSearchState {}

class LoadingLocations extends LocationSearchState {}

class LocationSearchError extends LocationSearchState {
  LocationSearchError(this.failure);
  final LocationFailure failure;
}

class LocationsLoaded extends LocationSearchState {
  LocationsLoaded(this.locations);
  final List<Location> locations;
}
