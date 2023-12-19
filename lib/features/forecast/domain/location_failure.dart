import 'package:weather_app/features/core/domain/failure.dart';

sealed class LocationFailure extends Failure {}

class LocationNotFoundFailure extends LocationFailure {}

class LocationSaveFailure extends LocationFailure {}
