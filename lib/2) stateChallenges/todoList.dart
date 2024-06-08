import 'package:flutter/material.dart';

class TodoChallenge extends StatelessWidget {
  const TodoChallenge({super.key});

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book),
        title: const Expanded(
          child: Text('TOdo lists'),
        ),
      ),
      body: const TodoStateConfig(),
    );
  }
}

typedef HandleTodo = Function(String todo);

class TextFieldButton extends StatelessWidget {
  TextFieldButton({super.key, required this.handleButtonClick});
  final TextEditingController todoController = TextEditingController();
  final HandleTodo handleButtonClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: todoController,
          decoration: const InputDecoration(labelText: 'Enter todo'),
        ),
        ElevatedButton(
            onPressed: () => handleButtonClick(todoController.text),
            child: const Center(
              child: Text('SAVE'),
            ))
      ],
    );
  }
}

class TodoDisplay extends StatelessWidget {
  const TodoDisplay(
      {super.key, required this.todo, required this.handleTapTodo});
  final String todo;
  final HandleTodo handleTapTodo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTapTodo(todo),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan,
            child: Text(todo[0]),
          ),
          Text(todo)
        ],
      ),
    );
  }
}

class TodoStateConfig extends StatefulWidget {
  const TodoStateConfig({super.key});

  @override
  State<TodoStateConfig> createState() => _TodoStateDisplay();
}

class _TodoStateDisplay extends State<TodoStateConfig> {
  List<String> todoList = [];
  void handleClick(String todo) {
    print(todo);
    setState(() {
      if (todo.isNotEmpty) {
        todoList.add(todo);
      }
    });
  }

  void handleTapTodo(String todo) {
    setState(() {
      todoList.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldButton(
          handleButtonClick: handleClick,
        ),
        Expanded(
          child: ListView(
            children: todoList.map((todo) {
              return TodoDisplay(todo: todo, handleTapTodo: handleTapTodo);
            }).toList(),
          ),
        )
      ],
    );
  }
}
