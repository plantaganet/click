import 'package:flutter/material.dart';

class HomeTemplate extends StatelessWidget {
  final Widget content;

  const HomeTemplate({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: content,
    );
  }
}
