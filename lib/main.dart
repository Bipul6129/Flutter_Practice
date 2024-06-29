import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/10)%20Navigation/NavigatorPushPop.dart';
import 'package:flutter_application_1/10)%20Navigation/ReturnData.dart';
import 'package:flutter_application_1/10)%20Navigation/SendDataToNext.dart';
import 'package:flutter_application_1/10)%20Navigation/TabWorks.dart';
import 'package:flutter_application_1/11)%20ProviderWork/counterProvider.dart';
import 'package:flutter_application_1/4)%20SilverScrolls/ScrollAvatar.dart';
import 'package:flutter_application_1/5)%20layoutChallenges/SilverCard.dart';
import 'package:flutter_application_1/5)%20layoutChallenges/SilverListAndGrid.dart';
import 'package:flutter_application_1/5)%20layoutChallenges/responsiveDisplay.dart';
import 'package:flutter_application_1/7)%20Interactivity/DismissPrac.dart';
import 'package:flutter_application_1/7)%20Interactivity/DraggableLong.dart';
import 'package:flutter_application_1/7)%20Interactivity/InkwellWork.dart';
import 'package:flutter_application_1/8)%20InteractivityChallenges/AddNumber.dart';
import 'package:flutter_application_1/8)%20InteractivityChallenges/KanbanBoard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starting app',
      home: ChangeNotifierProvider(
        create: (context) => CounterState(),
        child: const CounterProviderScaffold(),
      ),
    );
  }
}
