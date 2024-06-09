import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/1)%20gettingStarted/callbackIncrement.dart';
import 'package:flutter_application_1/1)%20gettingStarted/gestureHandle.dart';
import 'package:flutter_application_1/1)%20gettingStarted/incrementer.dart';
import 'package:flutter_application_1/1)%20gettingStarted/productAddRemove.dart';
import 'package:flutter_application_1/1)%20gettingStarted/removeElement.dart';
import 'package:flutter_application_1/1)%20gettingStarted/starting.dart';
import 'package:flutter_application_1/2)%20stateChallenges/backgroundChallenge.dart';
import 'package:flutter_application_1/2)%20stateChallenges/counterChallenge.dart';
import 'package:flutter_application_1/2)%20stateChallenges/favoriteChallenge.dart';
import 'package:flutter_application_1/2)%20stateChallenges/formValidation.dart';
import 'package:flutter_application_1/2)%20stateChallenges/todoList.dart';
import 'package:flutter_application_1/2)%20stateChallenges/toggleChallenge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Starting app',
      home: FavoriteChallengeScaffold(),
    );
  }
}
