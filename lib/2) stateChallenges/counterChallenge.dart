import 'package:flutter/material.dart';

class CounterChallengeScaffold extends StatelessWidget {
  const CounterChallengeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chair),
        title: const Text('Challenge COunter'),
      ),
      body: const CountStateConfig(),
    );
  }
}

typedef CallbackCounter = Function();

class CounterDisplay extends StatelessWidget {
  const CounterDisplay(
      {super.key,
      required this.count,
      required this.callFunc,
      required this.decFunc});
  final int count;
  final CallbackCounter callFunc, decFunc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Counter'),
        Text('$count'),
        ElevatedButton(
            onPressed: callFunc,
            child: const Center(
              child: Text('Increase'),
            )),
        ElevatedButton(
            onPressed: decFunc,
            child: const Center(
              child: Text('Decrease'),
            )),
      ],
    );
  }
}

class CountStateConfig extends StatefulWidget {
  const CountStateConfig({super.key});

  @override
  State<CountStateConfig> createState() => _CountStateDisplay();
}

class _CountStateDisplay extends State<CountStateConfig> {
  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          CounterDisplay(
            count: counter,
            callFunc: increase,
            decFunc: decrease,
          )
        ],
      ),
    );
  }
}
