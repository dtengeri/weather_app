part of 'location_cubit.dart';

sealed class LocationState {}

class UnknownLocation extends LocationState {}

class LoadingLocation extends LocationState {}

class LastLocation extends LocationState {
  LastLocation(this.location);
  final Location location;
}

class LocationError extends LocationState {
  LocationError(this.failure);
  final LocationFailure failure;
}
