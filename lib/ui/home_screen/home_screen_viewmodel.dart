import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/locator.dart';
import '../../models/task.dart';
import '../../services/tasks.services.dart';

class HomeScreenViewModel extends ReactiveViewModel {
  final _firstTaskFocusNode = FocusNode();
  final _tasksService = locator<TasksService>();
  late final toggleStatus = _tasksService.toggleStatus;
  late final removeTask = _tasksService.removeTask;
  late final updateTaskTitle = _tasksService.updateTaskTitle;

  List<Task> get tasks => _tasksService.tasks;

  void newTask() {
    _tasksService.newTask();
    _firstTaskFocusNode.requestFocus();
  }

  FocusNode? getFocusNode(String id) {
    final index = tasks.indexWhere((task) => task.id == id);
    return index == 0 ? _firstTaskFocusNode : null;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_tasksService];
}
