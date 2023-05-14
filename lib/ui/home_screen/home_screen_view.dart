import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../generated/l10n.dart';
import 'home_screen_viewmodel.dart';
import '../tasks/dialog/task_dialog.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(title: const Text('Nabu')),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            if (model.tasks.isEmpty)
              Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    SizedBox(height: 64),
                    Icon(Icons.emoji_food_beverage_outlined, size: 48),
                    SizedBox(height: 16),
                    Text(S.of(context).noTasksYet),
                  ],
                ),
              ),
            ...model.tasks.map((task) {
              return ListTile(
                leading: IconButton(
                  icon: Icon(
                    task.isCompleted ? Icons.task_alt : Icons.circle_outlined,
                  ),
                  onPressed: () => model.toggleStatus(task.id),
                ),
                title: TextField(
                  controller: TextEditingController(text: task.title),
                  decoration: null,
                  focusNode: model.getFocusNode(task.id),
                  maxLines: null,
                  onChanged: (text) => model.updateTaskTitle(task.id, text),
                  style: TextStyle(
                    fontSize: 20,
                    decoration:
                        task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.horizontal_rule),
                  onPressed: () => model.removeTask(task.id),
                ),
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const TaskDialog();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
