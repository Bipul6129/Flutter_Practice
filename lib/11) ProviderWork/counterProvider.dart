import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderScaffold extends StatelessWidget {
  const CounterProviderScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CounterDisplay(),
    );
  }
}

class CounterState extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Consumer<CounterState>(builder: (context, counter, child) {
            return Text('${counter.count}');
          }),
          ElevatedButton(
              onPressed: () {
                context.read<CounterState>().increment();
              },
              child: const Text('increase'))
        ],
      ),
    );
  }
}
