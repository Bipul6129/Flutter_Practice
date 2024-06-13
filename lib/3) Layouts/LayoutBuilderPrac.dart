import 'package:flutter/material.dart';

class LayoutbuilderpracScaffold extends StatelessWidget {
  const LayoutbuilderpracScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable'),
      ),
      body: const LayoutDisplay(),
    );
  }
}

class LayoutDisplay extends StatelessWidget {
  const LayoutDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  return Card(
                      color: Colors.yellow,
                      child: SizedBox(
                        height: 100,
                        child: Text('hello from $index'),
                      ));
                })),
          ),
        ),
      );
    });
  }
}
