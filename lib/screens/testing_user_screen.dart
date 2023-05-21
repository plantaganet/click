import 'package:flutter/material.dart';
import 'package:click/screen_templates/template_user.dart';

class TestingUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserTemplate(
      appBarTitle: 'User',
      content: Center(child: Text('User Content')),
      backgroundColor: Colors.green,
      profileImageUrl: 'https://via.placeholder.com/300.png/09f/fff',
      onProfilePressed: () => Navigator.pushNamed(context, '/profile'),
    );
  }
}
