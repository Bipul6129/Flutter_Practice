import 'package:flutter/material.dart';

class GestureScaffold extends StatelessWidget {
  const GestureScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: const Center(
        child: GesButton(),
      ),
    );
  }
}

class GesButton extends StatelessWidget {
  const GesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print('button tapped')},
      child: Container(
        width: 80,
        height: 40,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 121, 216, 125)),
        child: const Text('click me'),
      ),
    );
  }
}
