import 'package:hive/hive.dart';

class TodoListData {
  List tasks = [];

  final _mybox = Hive.box('box');

  void createInitialData() {
    tasks = [
      ['Add Your Task here', false],
      ['Swipe Left to delete', false],
    ];
  }

  void loadData() {
    tasks = _mybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mybox.put("TODOLIST", tasks);
  }
}
