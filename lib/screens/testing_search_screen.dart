import 'package:click/Data/global_enums.dart';
import 'package:click/models/activity_data.dart';
import 'package:click/models/user_data.dart';
import 'package:click/screen_templates/template_search.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestingSearchScreen extends StatelessWidget {
  // Sample users
  final user1 = UserData(
    userID: '1',
    username: 'John',
    imageUrl: 'https://via.placeholder.com/300.png/09f/fff',
    age: 25,
    gender: UserGender.female,
    activitiesAttended: 5,
    activitiesFavourite: 'Jumping',
    activitiesHosted: 3,
  );
  final user2 = UserData(
    userID: '2',
    username: 'Rebecca',
    imageUrl: 'https://via.placeholder.com/300.png/09f/fff',
    age: 20,
    gender: UserGender.female,
    activitiesAttended: 50,
    activitiesFavourite: 'Swimming',
    activitiesHosted: 30,
  );
  final user3 = UserData(
    userID: '3',
    username: 'Jillian',
    imageUrl: 'https://via.placeholder.com/300.png/09f/fff',
    age: 30,
    gender: UserGender.female,
    activitiesAttended: 12,
    activitiesFavourite: 'Horse Ridding',
    activitiesHosted: 40,
  );

  // Sample activities
  List<ActivityData> getSampleActivities() {
    return [
      ActivityData(
        activityId: 'A1',
        activityName: 'Running',
        activityOwner: user1,
        currentAttendees: [user2, user3],
        userStatus: [UserStatus.Joined, UserStatus.Pending],
        dateCreated: DateTime.now(),
        dateActive: DateTime.now(),
        activityLocation: 'Park',
        activityPosition: LatLng(37.4219999, -122.0840575),
        minAge: 20,
        maxAge: 40,
        acceptableGenders: UserGender.other,
        acceptableDistance: 5,
        maxDegreeOfFriends: 2,
        maxPeople: 10,
      ),
      ActivityData(
        activityId: 'A2',
        activityName: 'Jumping',
        activityOwner: user1,
        currentAttendees: [user2, user3],
        userStatus: [UserStatus.Joined, UserStatus.Joined],
        dateCreated: DateTime.now(),
        dateActive: DateTime.now(),
        activityLocation: 'Park',
        activityPosition: LatLng(300, 122.0840575),
        minAge: 25,
        maxAge: 35,
        acceptableGenders: null,
        acceptableDistance: 5,
        maxDegreeOfFriends: 2,
        maxPeople: 10,
      ),
      ActivityData(
        activityId: 'A2',
        activityName: 'Singing',
        activityOwner: user3,
        currentAttendees: [],
        userStatus: [],
        dateCreated: DateTime.now(),
        dateActive: DateTime.now(),
        activityLocation: 'Park',
        activityPosition: LatLng(100.4219999, -29.0840575),
        minAge: 18,
        maxAge: 25,
        acceptableGenders: UserGender.male,
        acceptableDistance: 5,
        maxDegreeOfFriends: 2,
        maxPeople: 10,
      ),
      // Add more sample activities here
    ];
  }

  void _refreshActivities() {
    // Implement refresh functionality
    print("Refresh activities");
  }

  void _changeFilters(BuildContext context) {
    // Implement filter changing functionality
    print("Change filters");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateSearch(
        activities: getSampleActivities(),
        onAccept: (String activityId) {
          // Implement accept function
        },
        onReject: (String activityId) {
          // Implement reject function
        },
        onRefresh: () => _refreshActivities(),
        onChangeFilters: () => _changeFilters(context),
      ),
    );
  }
}
