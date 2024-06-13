import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/4)%20SilverScrolls/ScrollAvatar.dart';
import 'package:flutter_application_1/5)%20layoutChallenges/responsiveDisplay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Starting app',
      home: ResponsivedisplayScaffold(),
    );
  }
}
