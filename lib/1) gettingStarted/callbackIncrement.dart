import 'package:flutter/material.dart';

class CallbackScaffold extends StatelessWidget {
  const CallbackScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CallbackImplement'),
      ),
      body: const CounterConfig(),
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Click me'));
  }
}

class ShowCounter extends StatelessWidget {
  const ShowCounter({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}

class CounterConfig extends StatefulWidget {
  const CounterConfig({super.key});

  @override
  State<CounterConfig> createState() => _Counter();
}

class _Counter extends State<CounterConfig> {
  int count = 0;

  void setCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ShowCounter(count: count), ClickButton(onPressed: setCounter)],
    );
  }
}
