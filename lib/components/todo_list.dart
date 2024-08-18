import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;

  const TodoList({
    super.key,
    required this.taskCompleted,
    required this.taskName,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed,
              label: 'Delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                side: const BorderSide(
                  color: Colors.white,
                  width: 1.8,
                ),
                checkColor: Colors.indigo,
                activeColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}