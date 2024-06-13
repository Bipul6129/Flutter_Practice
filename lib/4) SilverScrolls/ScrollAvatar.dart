import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollAvatarScaffold extends StatelessWidget {
  const ScrollAvatarScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScrollDisplay(),
    );
  }
}

class ScrollDisplay extends StatelessWidget {
  const ScrollDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('heading'),
          backgroundColor: Colors.brown,
          expandedHeight: 25,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            child: CarousalScroll(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return const BlockScrollDisplay();
        }, childCount: 5))
      ],
    );
  }
}

class CarousalScroll extends StatelessWidget {
  const CarousalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return const Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 35,
                child: Text('U'),
              ));
        }, childCount: 20)),
      ],
    );
  }
}

class BlockScrollDisplay extends StatelessWidget {
  const BlockScrollDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 300,
        color: Colors.grey,
      ),
    );
  }
}
