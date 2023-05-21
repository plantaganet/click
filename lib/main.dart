import 'package:click/screens/testing_profile_screen.dart';
import 'package:click/screens/testing_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:click/screens/testing_home_screen.dart';
import 'package:click/screens/testing_guest_screen.dart';
import 'package:click/screens/testing_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const TestingHomeScreen(),
        '/guest': (context) => TestingGuestScreen(),
        '/user': (context) => TestingUserScreen(),
        '/friends': (context) => const Text('Friends Screen'),
        '/calendar': (context) => const Text('Calendar Screen'),
        '/settings': (context) => const Text('Settings Screen'),
        '/profile': (context) => TestingProfileScreen(userID: '12345'),
        '/search': (context) => TestingSearchScreen(),
      },
      initialRoute: '/search',
    );
  }
}
