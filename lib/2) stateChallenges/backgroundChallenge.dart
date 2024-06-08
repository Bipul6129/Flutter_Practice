import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundChallengeScaffold extends StatelessWidget {
  const BackgroundChallengeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: const Text('Change Background'),
      ),
      body: const BackgroundStateConfig(),
    );
  }
}

typedef CallbacBackground = Function();

class ChangeButton extends StatelessWidget {
  const ChangeButton({super.key, required this.changeBack});
  final CallbacBackground changeBack;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => changeBack(),
        child: const Center(
          child: Text('Change'),
        ));
  }
}

class BackgroundStateConfig extends StatefulWidget {
  const BackgroundStateConfig({super.key});

  @override
  State<BackgroundStateConfig> createState() => _BackgroundStateDisplay();
}

class _BackgroundStateDisplay extends State<BackgroundStateConfig> {
  Color color = Colors.red;
  bool isChanged = false;

  void handleChange() {
    setState(() {
      isChanged = !isChanged;
      if (isChanged) {
        color = Colors.green;
      } else {
        color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ChangeButton(
        changeBack: handleChange,
      ),
    );
  }
}
