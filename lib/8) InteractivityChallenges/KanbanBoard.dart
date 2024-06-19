import 'package:flutter/material.dart';

class Board {
  Board(
      {required this.bgColor, required this.boardName, required this.taskList});

  Color bgColor;
  String boardName;
  List<Task> taskList;
}

class Task {
  Task({required this.task, required this.status});
  String task;
  String status;
}

typedef CallBackBoardFunction = Function(Task task, Board board);

class KanbanBoard extends StatelessWidget {
  const KanbanBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: KanbanState(),
    );
  }
}

class KanbanState extends StatefulWidget {
  const KanbanState({super.key});
  @override
  State<KanbanState> createState() => _KanbanDisplay();
}

class _KanbanDisplay extends State<KanbanState> {
  final List<Board> boardList = [
    Board(bgColor: Colors.green, boardName: 'Done', taskList: []),
    Board(bgColor: Colors.yellow, boardName: 'Pending', taskList: []),
    Board(bgColor: Colors.red, boardName: 'Cancled', taskList: [])
  ];

  final List<Task> taskList = [
    Task(task: 'do meeting', status: 'none'),
    Task(task: 'do work', status: 'none'),
    Task(task: 'do hw', status: 'none'),
    Task(task: 'do practice', status: 'none'),
    Task(task: 'do coding', status: 'none'),
    Task(task: 'do fun', status: 'none'),
    Task(task: 'do enjoy', status: 'none'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onAcceptTask(Task task, Board board) {
    setState(() {
      taskList.remove(task);
      board.taskList.add(task);
      for (int i = 0; i < boardList.length; i++) {
        if (boardList[i] == board) {
        } else {
          if (boardList[i].taskList.contains(task)) {
            boardList[i].taskList.remove(task);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: [
              KanbanBoardDisplay(
                boardList: boardList,
                onAcceptTask: onAcceptTask,
              )
            ],
          ),
        ),
        Expanded(child: LayoutBuilder(builder: (context, constraints) {
          return DragTarget<Task>(
            builder: (context, accepted, rejected) {
              return Container(
                decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(7)),
                    backgroundBlendMode: BlendMode.multiply,
                    color: Color.fromARGB(255, 30, 36, 54)),
                child: CustomScrollView(
                  slivers: [
                    TaskListDisplay(
                        taskList: taskList, parentConstrant: constraints)
                  ],
                ),
              );
            },
            onAcceptWithDetails: (details) {
              setState(() {
                for (int i = 0; i < boardList.length; i++) {
                  boardList[i].taskList.remove(details.data);
                }
                if (!taskList.contains(details.data)) {
                  taskList.add(details.data);
                }
              });
            },
          );
        }))
      ],
    );
  }
}

class TaskListDisplay extends StatelessWidget {
  const TaskListDisplay(
      {super.key, required this.taskList, required this.parentConstrant});
  final List<Task> taskList;
  final BoxConstraints parentConstrant;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: LongPressDraggable<Task>(
              data: taskList[index],
              feedback: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  width: parentConstrant.maxWidth - 200,
                  height: 37,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      taskList[index].task,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              childWhenDragging: Container(
                color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    taskList[index].task,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    taskList[index].task,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: taskList.length,
      ),
    );
  }
}

class KanbanBoardDisplay extends StatelessWidget {
  const KanbanBoardDisplay(
      {super.key, required this.boardList, required this.onAcceptTask});
  final List<Board> boardList;
  final CallBackBoardFunction onAcceptTask;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, childAspectRatio: 0.7),
      itemBuilder: (context, boardindex) {
        return LayoutBuilder(builder: (context, parentConstraint) {
          return DragTarget<Task>(
            builder: (context, accepted, rejected) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: boardList[boardindex].bgColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.4)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset:
                                  Offset(0, 3), // Offset in x and y direction
                            ),
                          ]),
                      child: ListView.builder(
                        itemBuilder: (context, taskindex) {
                          return LongPressDraggable<Task>(
                            data: boardList[boardindex].taskList[taskindex],
                            feedback: Opacity(
                              opacity: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: parentConstraint.maxWidth - 20,
                                  height: 25,
                                  color: Colors.amber,
                                  child: Center(
                                    child: Text(
                                      boardList[boardindex]
                                          .taskList[taskindex]
                                          .task,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(boardList[boardindex]
                                      .taskList[taskindex]
                                      .task),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: boardList[boardindex].taskList.length,
                      ),
                    ),
                  ));
            },
            onAcceptWithDetails: (details) {
              print(
                  '${details.data.task} in ${boardList[boardindex].boardName}');
              if (boardList[boardindex].taskList.contains(details.data)) {
                print('already exists');
              } else {
                onAcceptTask(details.data, boardList[boardindex]);
              }
            },
          );
        });
      },
      itemCount: boardList.length,
    );
  }
}
