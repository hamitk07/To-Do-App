import 'package:flutter/material.dart';
import 'package:flutter_1/utils/todo_list.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List todolist = [
    ["Wake up", false],
  ];

  void chechBoxChanged(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // App Bar
        appBar: AppBar(
          title: Text(
            "To Do List",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 27,
              color: Color.fromARGB(255, 198, 212, 4),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        // Body
        body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
            return TodoList(
              key: ValueKey(todolist[index][0]),
              taskName: todolist[index][0],
              taskCompleted: todolist[index][1],
              onChanged: (value) => chechBoxChanged(index),
              onDelete: () => deleteTask(index),
            );
          },
        ),
        // FAB
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // klavye açıldığında yukarı kayması için
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  String newTask = "";
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(
                        context,
                      ).viewInsets.bottom, // klavye boşluğu
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            labelText: "New Task",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            newTask = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (newTask.isNotEmpty) {
                                setState(() {
                                  todolist.add([newTask, false]);
                                });
                                Navigator.pop(context); // sheet’i kapat
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: const Color.fromARGB(
                                255,
                                198,
                                212,
                                4,
                              ),
                            ),
                            child: const Text("Add"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.add,
              size: 40,
              color: Color.fromARGB(255, 198, 212, 4),
            ),
          ),
        ),
        // Bottom Nav Bar
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: Icon(Icons.home),
                color: Color.fromARGB(255, 198, 212, 4),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: Icon(Icons.settings),
                color: Color.fromARGB(255, 198, 212, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
