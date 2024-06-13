import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SilverFixScaffold extends StatelessWidget {
  const SilverFixScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SilverDisplayState(),
    );
  }
}

class SilverDisplayState extends StatefulWidget {
  const SilverDisplayState({super.key});

  @override
  State<SilverDisplayState> createState() => _SilverDisplay();
}

class _SilverDisplay extends State<SilverDisplayState> {
  List<int> numbers = [];

  void onAddNum() {
    setState(() {
      if (numbers.isEmpty) {
        numbers.add(1);
      } else {
        numbers.add(numbers[numbers.length - 1] + 1);
      }
      print(numbers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Center(
            child: ElevatedButton(
              onPressed: () => onAddNum(),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow)),
              child: const Text('click to add'),
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 300,
                  color: Colors.blue,
                  child: Center(
                    child: Text('hello from $index'),
                  ),
                ));
          }, childCount: numbers.length),
        )
      ],
    );
  }
}
