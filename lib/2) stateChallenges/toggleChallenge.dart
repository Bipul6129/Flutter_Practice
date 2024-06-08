import 'package:flutter/material.dart';

class ToggleChallengeScaffold extends StatelessWidget {
  const ToggleChallengeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.alarm),
        title: const Text('Toggle type'),
      ),
      body: const ToggleStateConfig(),
    );
  }
}

typedef FlipLightCallBack = Function();

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {super.key, required this.isActive, required this.flipLight});
  final bool isActive;
  final FlipLightCallBack flipLight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flipLight,
      child: Icon(
        isActive ? Icons.toggle_on_rounded : Icons.toggle_off_rounded,
      ),
    );
  }
}

class ToggleText extends StatelessWidget {
  const ToggleText({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return (isActive ? const Text('ON') : const Text('OFF'));
  }
}

class ToggleStateConfig extends StatefulWidget {
  const ToggleStateConfig({super.key});

  @override
  State<ToggleStateConfig> createState() => _ToggleStateDisplay();
}

class _ToggleStateDisplay extends State<ToggleStateConfig> {
  bool light = false;

  void flipL() {
    setState(() {
      light = !light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        ToggleText(isActive: light),
        ToggleButton(isActive: light, flipLight: flipL)
      ],
    ));
  }
}
