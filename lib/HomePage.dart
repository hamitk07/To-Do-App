import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Row(),
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
