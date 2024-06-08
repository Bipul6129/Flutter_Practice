import 'package:flutter/material.dart';

class IncreScaffold extends StatelessWidget {
  const IncreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incrementer'),
      ),
      body: const Center(child: IncreConfig()),
    );
  }
}

class IncreConfig extends StatefulWidget {
  const IncreConfig({super.key});

  @override
  State<IncreConfig> createState() => _IncreScreen();
}

class _IncreScreen extends State<IncreConfig> {
  int count = 0;

  void setCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count'),
        ElevatedButton(onPressed: setCount, child: const Text('Clik'))
      ],
    );
  }
}
