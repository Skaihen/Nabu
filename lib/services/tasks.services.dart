import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

import '../models/task.dart';

class TasksService with ListenableServiceMixin {
  final _tasks = ReactiveValue<List<Task>>(
    Hive.box('tasks').get('tasks', defaultValue: []).cast<Task>(),
  );
  final _random = Random();

  List<Task> get tasks => _tasks.value;

  TasksService() {
    listenToReactiveValues([_tasks]);
  }

  String _randomId() {
    return String.fromCharCodes(
      List.generate(10, (_) => _random.nextInt(33) + 80),
    );
  }

  void _saveToHive() => Hive.box('tasks').put('tasks', _tasks.value);

  void newTask() {
    _tasks.value.insert(0, Task(id: _randomId(), insertedAt: DateTime.now()));
    _saveToHive();
    notifyListeners();
  }

  bool removeTask(String id) {
    final index = _tasks.value.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks.value.removeAt(index);
      _saveToHive();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  bool toggleStatus(String id) {
    final index = _tasks.value.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks.value[index].isCompleted = !_tasks.value[index].isCompleted;
      _saveToHive();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  bool updateTaskTitle(String id, String text) {
    final index = _tasks.value.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks.value[index].title = text;
      _saveToHive();
      return true;
    } else {
      return false;
    }
  }
}
