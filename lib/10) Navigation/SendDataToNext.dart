import 'package:flutter/material.dart';

class SendDataToNextMaterial extends StatelessWidget {
  const SendDataToNextMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPageScaffold(),
    );
  }
}

class Todo {
  Todo(this.title, this.desc);
  String title;
  String desc;
}

class FirstPageScaffold extends StatelessWidget {
  FirstPageScaffold({super.key});
  final List<Todo> todoList =
      List.generate(20, (i) => (Todo('$i todo', 'Desc of $i todo')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('first'),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text('${todoList[index].title}'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TodoDetailScaffold(mytodo: todoList[index])));
                  });
            },
            itemCount: todoList.length,
          )
        ],
      ),
    );
  }
}

class TodoDetailScaffold extends StatelessWidget {
  const TodoDetailScaffold({super.key, required this.mytodo});
  final Todo mytodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Text(mytodo.desc),
    );
  }
}
