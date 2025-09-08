import 'package:flutter/material.dart';

enum SampleItem { itemOne }

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: widget.taskCompleted,
                onChanged: widget.onChanged,
                fillColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.black; // işaretliyken
                  }
                  return Colors.black; // işaretsizken
                }),
              ),
            ),
            Expanded(
              child: Text(
                widget.taskName,
                style: TextStyle(
                  color: const Color.fromARGB(255, 198, 212, 4),
                  fontSize: 20,
                  decoration: widget.taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ),
            PopupMenuButton<SampleItem>(
              icon: Icon(
                Icons.more_vert,
                color: const Color.fromARGB(255, 198, 212, 4),
              ),
              onSelected: (SampleItem item) {
                switch (item) {
                  case SampleItem.itemOne:
                    print("Edit seçildi");
                    // Buraya düzenleme fonksiyonunu yaz
                    break;
                }
              },
              initialValue: selectedItem,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.delete_outline),
                        ],
                      ),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
