import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';
import 'package:weather_app/features/forecast/domain/location_repository.dart';

part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required this.locationRepository,
  }) : super(UnknownLocation());

  final LocationRepository locationRepository;

  Future<void> getLastLocation() async {
    emit(LoadingLocation());
    final lastLocationOrFailure = await locationRepository.getLastLocation();
    lastLocationOrFailure.fold(
      (failure) => emit(LocationError(failure)),
      (location) => emit(LastLocation(location)),
    );
  }

  Future<void> changeLocation(Location location) async {
    final lastLocationOrFailure =
        await locationRepository.saveLastLocation(location);
    lastLocationOrFailure.fold(
      (failure) => emit(LocationError(failure)),
      (location) => emit(LastLocation(location)),
    );
  }
}
