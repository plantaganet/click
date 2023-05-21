import 'package:click/components/image_helpers.dart';
import 'package:flutter/material.dart';

class UserTemplate extends StatelessWidget {
  final String appBarTitle;
  final Widget content;
  final Color backgroundColor;
  final String? profileImageUrl;
  final VoidCallback onProfilePressed;

  UserTemplate({
    required this.appBarTitle,
    required this.content,
    required this.backgroundColor,
    this.profileImageUrl,
    required this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    final Brightness appBarBrightness = ThemeData.estimateBrightnessForColor(backgroundColor);

    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(0.8),
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarBrightness == Brightness.dark ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: ClipRRect(borderRadius: BorderRadius.circular(40), child: getImage(profileImageUrl, 40)),
            ),
            onPressed: onProfilePressed,
          ),
        ],
        brightness: appBarBrightness,
        elevation: 0.0,
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor.withOpacity(0.8),
        selectedItemColor: appBarBrightness == Brightness.dark ? Colors.white : Colors.black,
        unselectedItemColor: appBarBrightness == Brightness.dark ? Colors.white70 : Colors.black54,
        selectedIconTheme: const IconThemeData(size: 45.0),
        unselectedIconTheme: const IconThemeData(size: 30.0),
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/friends');
              break;
            case 2:
              Navigator.pushNamed(context, '/calendar');
              break;
            case 3:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
      ),
    );
  }
}
