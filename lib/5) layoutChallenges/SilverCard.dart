import 'package:flutter/material.dart';

class Silvercard extends StatelessWidget {
  const Silvercard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SilverCartMain(),
    );
  }
}

class SilverCartMain extends StatefulWidget {
  const SilverCartMain({super.key});

  @override
  State<SilverCartMain> createState() => _SilverCartDisplay();
}

class _SilverCartDisplay extends State<SilverCartMain> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [AppBarSilver()],
    );
  }
}

class AppBarSilver extends StatelessWidget {
  const AppBarSilver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      title: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                child: Text('test'),
              ),
            );
          },
        ),
      ),
    );
  }
}
