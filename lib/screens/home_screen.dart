import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/add_task.dart';
import 'package:todo_app/components/todo_list.dart';
import 'package:todo_app/data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('box');

  TodoListData db = TodoListData();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  void updateChange(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateDataBase();
  }

  void saveTask() {
    setState(() {
      db.tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
    db.updateDataBase();
  }

  void onDelete(int index) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        db.tasks.removeAt(index);
      });
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder: (context, index) => TodoList(
          taskCompleted: db.tasks[index][1],
          taskName: db.tasks[index][0],
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
