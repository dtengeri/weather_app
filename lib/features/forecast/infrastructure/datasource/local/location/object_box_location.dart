import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxLocation {
  @Id()
  int id = 0;

  String? city;
  String? country;
  double? longitude;
  double? latitude;

  @override
  String toString() {
    return 'ObjectBoxLocation(id: $id, city: $city, country: $country, longitude: $longitude, latitude: $latitude)';
  }
}
