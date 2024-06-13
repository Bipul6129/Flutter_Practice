import 'package:flutter/material.dart';

class GridViewScaffold extends StatelessWidget {
  const GridViewScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
        ),
        body: const ListViewDisplay());
  }
}

class GridViewDisplay extends StatelessWidget {
  const GridViewDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(150, (index) {
        return Center(
          child: Text('$index'),
        );
      }),
    );
  }
}

class ListViewDisplay extends StatelessWidget {
  const ListViewDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text('heading'),
          subtitle: Text('this is index $index'),
        );
      },
    );
  }
}
