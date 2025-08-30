import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

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
                value: taskCompleted,
                onChanged: onChanged,
                fillColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.black; // İşaretli olduğunda renk
                  }
                  return const Color.fromARGB(
                    0,
                    158,
                    158,
                    158,
                  ); // İşaretsiz durum rengi
                }),
              ),
            ),
            Text(
              taskName,
              style: const TextStyle(
                color: Color.fromARGB(255, 198, 212, 4),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
