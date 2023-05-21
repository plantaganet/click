import 'package:click/Data/global_enums.dart';
import 'package:google_maps_webservice/places.dart';

class FilterData {
  PlaceDetails? preferredLocation;
  int? minAge;
  int? maxAge;
  List<UserGender>? acceptableGenders;
  double distance;
  int degreesOfFriends;
  int totalNumber;

  FilterData({
    this.preferredLocation,
    this.minAge = 5,
    this.maxAge = 5,
    this.acceptableGenders,
    this.distance = 5.0,
    this.degreesOfFriends = 3,
    this.totalNumber = 3,
  });
}
