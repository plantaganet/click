import 'package:click/Data/global_enums.dart';

class UserData {
  final String userID;
  final String username;
  final int age;
  final UserGender gender;
  final String? imageUrl;
  final int activitiesHosted;
  final int activitiesAttended;
  final String? activitiesFavourite;

  UserData(
      {required this.userID,
      this.imageUrl,
      required this.age,
      required this.username,
      required this.gender,
      required this.activitiesAttended,
      required this.activitiesFavourite,
      required this.activitiesHosted});
}
