import 'package:flutter/material.dart';

class SilverlistandgridScaffold extends StatelessWidget {
  const SilverlistandgridScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SilverScroll(),
    );
  }
}

class SilverScroll extends StatelessWidget {
  const SilverScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 60,
                  color: Colors.yellow,
                ));
          },
          itemCount: 4,
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 600,
                  color: Colors.blue,
                ));
          },
          itemCount: 8,
        )
      ],
    );
  }
}
