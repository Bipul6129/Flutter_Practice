import 'package:flutter/material.dart';

class ListVListTScaffold extends StatelessWidget {
  const ListVListTScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workig'),
      ),
      body: const ListDisplay(),
    );
  }
}

class ListDisplay extends StatelessWidget {
  const ListDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getTiles(),
      padding: EdgeInsets.all(20),
    );
  }
}

List<ListTile> getTiles() {
  List<ListTile> tiles = [];

  for (int i = 0; i < 10; i++) {
    tiles.add(ListTile(
      leading: const Icon(Icons.lens_rounded),
      title: Text('This is title for $i'),
      subtitle: const Text('hello guys this is the text areas'),
    ));
  }
  return tiles;
}
