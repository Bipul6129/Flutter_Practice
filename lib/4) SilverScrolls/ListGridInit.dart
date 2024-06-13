import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListgridinitScaffold extends StatelessWidget {
  const ListgridinitScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SilverDisplay(),
    );
  }
}

class SilverDisplay extends StatelessWidget {
  const SilverDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          // expandedHeight: 150,
          leading: Icon(Icons.ac_unit_sharp),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text('grid element $index'),
            );
          }, childCount: 20),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                color: Colors.green,
                child: Text('hello from $index'),
              ),
            );
          }, childCount: 15),
        )
      ],
    );
  }
}
