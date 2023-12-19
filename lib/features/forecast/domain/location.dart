import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String city,
    required String country,
    required double latitude,
    required double longitude,
  }) = _Location;
}
