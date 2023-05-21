import 'package:click/Data/global_enums.dart';
import 'package:click/models/user_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityData {
  final String activityId;
  final String? activityName;
  final UserData activityOwner;
  final List<UserData> currentAttendees;
  final List<UserStatus> userStatus;
  final DateTime dateCreated;
  final DateTime dateActive;
  final String? activityLocation;
  final LatLng activityPosition;
  int? minAge;
  int? maxAge;
  UserGender? acceptableGenders;
  final int acceptableDistance;
  final int maxDegreeOfFriends;
  final int maxPeople;

  ActivityData({
    required this.activityId,
    this.activityName,
    required this.activityOwner,
    required this.currentAttendees,
    required this.userStatus,
    required this.dateCreated,
    required this.dateActive,
    this.activityLocation,
    required this.activityPosition,
    required this.minAge,
    required this.maxAge,
    required this.acceptableGenders,
    required this.acceptableDistance,
    required this.maxDegreeOfFriends,
    required this.maxPeople,
  });
}
