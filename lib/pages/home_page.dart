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
    ["Drink water", false],
    ["Code flutter", false],
  ];

  void chechBoxChanged(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
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
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: todolist[index][0],
              taskCompleted: todolist[index][1],
              onChanged: (value) => chechBoxChanged(index),
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
            onPressed: () {},
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
