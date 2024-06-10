import 'package:flutter/material.dart';

class LayouttestScaffold extends StatelessWidget {
  const LayouttestScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayLayout(),
    );
  }
}

class DisplayLayout extends StatelessWidget {
  const DisplayLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(flex: 1, child: imageContainer()),
      const Expanded(
        flex: 2,
        child: Column(
          children: [DescriptionSection(), OptionSection(), TextSection()],
        ),
      )
    ]);
  }
}

//TextSection
class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Text(
            'he Expanded widget is typically used to make its child occupy the available space within a Column, Row, or Flex widget. However, applying padding directly to the child of Expanded won’t work as expected because it affects the entire expanded area, including the sides.he Expanded widget is typically used to make its child occupy the available space within a Column, Row, or Flex widget. However, applying padding directly to the child of Expanded won’t work as expected because it affects the entire expanded area, including the sides.'));
  }
}

// OptionsSection
class OptionSection extends StatelessWidget {
  const OptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:
          EdgeInsetsDirectional.only(start: 60, end: 60, top: 10, bottom: 10),
      // padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.call,
                size: 32,
                color: Colors.blue,
              ),
              Text(
                'Call',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.airplane_ticket,
                size: 32,
                color: Colors.blue,
              ),
              Text(
                'Route',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                size: 32,
                color: Colors.blue,
              ),
              Text(
                'Share',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// IMAGE SECTION
Container imageContainer() {
  return Container(
    width: double.infinity,
    child: Image.network(
      'https://live.staticflickr.com/65535/49226513723_b542918636_b.jpg',
      fit: BoxFit.cover,
    ),
  );
}

// DESCRIPTION SECTION
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heading',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Text('sub headings')
                ],
              )),
          Expanded(
              flex: 2,
              child: Icon(
                Icons.star,
                size: 28,
                color: Colors.red,
              )),
          Expanded(
              flex: 1,
              child: Text(
                '41',
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }
}
