import 'package:flutter/material.dart';

class GuestTemplate extends StatelessWidget {
  final Widget child;
  final String pageTitle;
  final Color backgroundColor;

  GuestTemplate({
    required this.child,
    required this.pageTitle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Estimate the brightness of the background color
    Brightness estimatedBrightness = ThemeData.estimateBrightnessForColor(backgroundColor);

    // Determine text and icon colors based on the estimated brightness
    Color textColor = estimatedBrightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(color: textColor), // Set text color based on the background color
        ),
        backgroundColor: backgroundColor.withOpacity(0.8), // Set AppBar background color with transparency
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor), // Set icon color based on the background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
