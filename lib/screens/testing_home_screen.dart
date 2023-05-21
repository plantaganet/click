import 'package:flutter/material.dart';
import 'package:click/screen_templates/template_home.dart';

class TestingHomeScreen extends StatelessWidget {
  const TestingHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeTemplate(
      content: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
