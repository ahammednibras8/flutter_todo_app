import 'package:flutter/material.dart';
import 'package:todo_app/components/buttons.dart';

class AddTask extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AddTask({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[100],
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white60,
                  hintText: 'Add new task',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttons(
                  name: 'Cancel',
                  bgColor: Colors.red,
                  fgColor: Colors.white,
                  onPressed: onCancel,
                ),
                Buttons(
                  name: 'Submit',
                  bgColor: Colors.indigo,
                  fgColor: Colors.white,
                  onPressed: onSave,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
