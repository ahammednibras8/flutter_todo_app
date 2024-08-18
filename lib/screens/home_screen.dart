import 'package:flutter/material.dart';
import 'package:todo_app/components/add_task.dart';
import 'package:todo_app/components/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List tasks = [
    ['Todo app', false],
    ['Youtube', false],
    ['Tea', false]
  ];

  void updateChange(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void saveTask() {
    setState(() {
      tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void addTask() {
    showDialog(
      context: context,
      builder: (context) => AddTask(
        controller: _controller,
        onSave: saveTask,
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  void onDelete(int index) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        tasks.removeAt(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TodoList(
          taskCompleted: tasks[index][1],
          taskName: tasks[index][0],
          onChanged: (value) => updateChange(value, index),
          onPressed: (context) => onDelete(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
