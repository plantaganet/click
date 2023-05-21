import 'package:flutter/material.dart';
import 'package:click/screen_templates/template_guest.dart';

class TestingGuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GuestTemplate(
      pageTitle: 'Guest Screen',
      backgroundColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            30,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('Item ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
