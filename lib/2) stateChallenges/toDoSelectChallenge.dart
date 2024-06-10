import 'package:flutter/material.dart';

class todoSelectScaffold extends StatelessWidget {
  const todoSelectScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('LOL'),
        title: const Text('Welcome to select'),
        backgroundColor: Colors.brown,
      ),
      body: const todoSelectStateConfig(
        todos: ['work', 'sleep'],
      ),
    );
  }
}

typedef CallbackCheck = Function(String todo);

class todoDisplay extends StatelessWidget {
  todoDisplay(
      {super.key,
      required this.todo,
      required this.isSelected,
      required this.callFunc});
  final String todo;
  final bool isSelected;
  final CallbackCheck callFunc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => callFunc(todo),
        child: Row(
          children: [
            Icon(isSelected ? Icons.check : Icons.check_box_outline_blank),
            Text(todo)
          ],
        ));
  }
}

class todoSelectStateConfig extends StatefulWidget {
  const todoSelectStateConfig({super.key, required this.todos});
  final List<String> todos;

  @override
  State<todoSelectStateConfig> createState() => _todoSelectDisplay();
}

class _todoSelectDisplay extends State<todoSelectStateConfig> {
  List<String> selected = [];
  List<String> notSelected = [];

  @override
  void initState() {
    super.initState();
    notSelected = List.from(widget.todos);
  }

  void checkTodo(String todo) {
    setState(() {
      if (notSelected.contains(todo)) {
        notSelected.remove(todo);
        selected.add(todo);
      }
    });
  }

  void Remcheck(String todo) {
    setState(() {
      if (selected.contains(todo)) {
        selected.remove(todo);
        notSelected.add(todo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: ListView(
          children: widget.todos.map((todo) {
            if (notSelected.contains(todo)) {
              return (todoDisplay(
                todo: todo,
                isSelected: false,
                callFunc: checkTodo,
              ));
            } else {
              return (todoDisplay(
                todo: todo,
                isSelected: true,
                callFunc: Remcheck,
              ));
            }
          }).toList(),
        ));
  }
}
