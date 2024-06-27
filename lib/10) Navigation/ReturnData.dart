import 'package:flutter/material.dart';

class ReturnDataMaterial extends StatelessWidget {
  const ReturnDataMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPageScaffold(),
    );
  }
}

class FirstPageScaffold extends StatelessWidget {
  const FirstPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPageScaffod()));
                  print(result);
                },
                child: const Text('Selection Page'))
          ],
        )));
  }
}

class SecondPageScaffod extends StatelessWidget {
  const SecondPageScaffod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'data 1');
                },
                child: const Text('data 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'data 2');
                },
                child: const Text('data 2'))
          ],
        ),
      ),
    );
  }
}
