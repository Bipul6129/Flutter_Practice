import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyThemeApp());
}

class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 40, color: Colors.blue))),
      home: const MyScaffold(),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('hello', style: Theme.of(context).textTheme.displayLarge),
            const ElevatedButton(
              onPressed: null,
              child: Text('click me'),
            ),
            Theme(
                data: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
                child: const ElevatedButton(
                    onPressed: null, child: Text('click another')))
          ],
        ),
        // height: 300,
      ),
    );
  }
}
