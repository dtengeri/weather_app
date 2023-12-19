import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/forecast/domain/location.dart';
import 'package:weather_app/features/forecast/domain/location_failure.dart';
import 'package:weather_app/features/forecast/domain/location_repository.dart';

part 'location_search_state.dart';

@injectable
class LocationSearchCubit extends Cubit<LocationSearchState> {
  LocationSearchCubit({
    required this.locationRepository,
  }) : super(LocationSearchInitial());

  final LocationRepository locationRepository;

  Future<void> searchLocations(String cityName) async {
    emit(LoadingLocations());
    final locationsOrFailure =
        await locationRepository.getLocations(cityName: cityName);
    locationsOrFailure.fold(
      (failure) => emit(LocationSearchError(failure)),
      (locations) => emit(LocationsLoaded(locations)),
    );
  }
}
