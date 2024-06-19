import 'package:flutter/material.dart';

class Addnumber extends StatelessWidget {
  const Addnumber({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddnumberState(),
    );
  }
}

class AddnumberState extends StatefulWidget {
  const AddnumberState({super.key});

  @override
  State<AddnumberState> createState() => _AddnumberView();
}

class _AddnumberView extends State<AddnumberState> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: DragTarget<int>(
              builder: (context, accepted, rejected) {
                return (Container(
                  color: Colors.blue,
                  height: 400,
                  width: 400,
                  child: Center(
                    child: Text('$sum'),
                  ),
                ));
              },
              onAcceptWithDetails: (details) {
                print('accepted');
                setState(() {
                  sum += details.data;
                });
              },
            )),
        Expanded(child: LayoutBuilder(builder: (context, constraints) {
          return (ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: LongPressDraggable<int>(
                    data: numbers[index],
                    feedback: Container(
                      width: 150,
                      height: constraints.maxHeight - 20,
                      color: Color.fromARGB(255, 98, 193, 248),
                      child: Center(
                        child: Text(
                          '${numbers[index]}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      color: Colors.yellow,
                      child: Center(
                        child: Text(
                          '${numbers[index]}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ));
            },
            itemCount: numbers.length,
          ));
        }))
      ],
    );
  }
}
