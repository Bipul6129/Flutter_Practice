import 'package:flutter/material.dart';

class InkWellScaffold extends StatelessWidget {
  const InkWellScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InkWellView(),
    );
  }
}

class InkWellView extends StatelessWidget {
  const InkWellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.blue,
          onTap: () {
            print('tapped');
          },
          child: Container(
            child: const Text('click here'),
          ),
        )
      ],
    );
  }
}
