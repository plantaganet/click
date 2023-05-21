import 'package:click/Data/global_enums.dart';
import 'package:click/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:click/screen_templates/template_profile.dart';

class TestingProfileScreen extends StatelessWidget {
  final String userID;

  TestingProfileScreen({required this.userID});

  @override
  Widget build(BuildContext context) {
    UserData currentUser = UserData(
        userID: '12345',
        username: 'John Doe',
        age: 25,
        gender: UserGender.male,
        imageUrl: null,
        activitiesAttended: 5,
        activitiesHosted: 2,
        activitiesFavourite: "Horse-riding");

    List<UserData> friends = [
      UserData(
          userID: '67890',
          username: 'Jane Smith',
          age: 28,
          gender: UserGender.female,
          imageUrl: 'https://cdn.shopify.com/s/files/1/1830/5085/products/VE0007_BCAA_Capsule_90ct_2048x2048.png?v=1494855182',
          activitiesAttended: 2,
          activitiesHosted: 17,
          activitiesFavourite: "Party"),
      UserData(
          userID: '54321',
          username: 'Mike Johnson',
          age: 31,
          gender: UserGender.male,
          imageUrl: 'https://via.placeholder.com/300.png/09f/fff',
          activitiesAttended: 50,
          activitiesHosted: 22,
          activitiesFavourite: "Painting"),
    ];

    return ProfileTemplate(
      backgroundColor: Colors.amber,
      currentUser: currentUser,
      friends: friends,
      profileAction: ProfileAction.edit,
      onActionPressed: () {
        print('Edit Profile');
      },
      onFriendPressed: (String friendUserID) {
        print('Friend with userID $friendUserID was tapped');
      },
    );
  }
}
