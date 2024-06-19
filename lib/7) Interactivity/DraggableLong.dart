import 'package:flutter/material.dart';

class DraggableLong extends StatelessWidget {
  const DraggableLong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DragBody(),
    );
  }
}

class DragBody extends StatelessWidget {
  const DragBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LongPressDraggable<String>(
          data: "data is bipul",
          feedback: Container(
            height: 40,
            width: 40,
            color: Color.fromARGB(255, 12, 83, 141),
          ),
          childWhenDragging: Container(
            height: 40,
            width: 40,
            color: Colors.yellow,
          ),
          child: Container(
            height: 40,
            width: 40,
            color: Colors.blue,
          ),
        ),
        DragTarget<String>(
          builder: (context, accepted, rejected) {
            return Container(
              width: 200,
              height: 200,
              color: Colors.black,
            );
          },
          onAcceptWithDetails: (details) {
            print(details.data);
          },
        )
      ],
    );
  }
}
