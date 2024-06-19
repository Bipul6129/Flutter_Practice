import 'package:flutter/material.dart';

class Dismissprac extends StatelessWidget {
  const Dismissprac({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DismissDisplay(),
    );
  }
}

class DismissDisplay extends StatefulWidget {
  const DismissDisplay({super.key});

  @override
  State<DismissDisplay> createState() => _DismissStateDisplay();
}

class _DismissStateDisplay extends State<DismissDisplay> {
  late List<int> numbers;
  @override
  void initState() {
    super.initState();
    numbers = [1, 2, 3, 4, 5];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = numbers[index];
        return Dismissible(
            onDismissed: (direction) {
              setState(() {
                numbers.remove(item);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('dismissed ${numbers[index]}')));
            },
            background: Container(
              color: Colors.red,
            ),
            key: Key(item.toString()),
            child: ListTile(title: Text('${numbers[index]}')));
      },
      itemCount: numbers.length,
    );
  }
}
