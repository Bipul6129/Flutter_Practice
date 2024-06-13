import 'package:flutter/material.dart';

class ResponsivedisplayScaffold extends StatelessWidget {
  const ResponsivedisplayScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveDisplay(),
    );
  }
}

class ResponsiveDisplay extends StatelessWidget {
  ResponsiveDisplay({super.key});
  final List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      child: screenSize.width > 600
          ? GridDisplayNum(nums: nums)
          : ListDisplayNum(nums: nums),
    );
  }
}

class ListDisplayNum extends StatelessWidget {
  const ListDisplayNum({super.key, required this.nums});
  final List<int> nums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Text('${nums[index]}'),
            ));
      },
      itemCount: nums.length,
    );
  }
}

class GridDisplayNum extends StatelessWidget {
  const GridDisplayNum({super.key, required this.nums});
  final List<int> nums;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          color: Colors.yellow,
          child: Text('${nums[index]}'),
        );
      },
      itemCount: nums.length,
    );
  }
}
