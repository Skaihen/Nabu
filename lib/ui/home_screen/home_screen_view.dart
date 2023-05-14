import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../generated/l10n.dart';
import '../tasks/task_list_tile.dart';
import 'home_screen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
              return CustomTaskListTile(
                  width: width,
                  tileTitleText: task.title,
                  tileFocusNode: model.getFocusNode(task.id),
                  isCompleted: task.isCompleted,
                  updateTaskTitle: (String text) =>
                      model.updateTaskTitle(task.id, text),
                  toggleCompletedButtonOnChanged: (bool? toggle) =>
                      model.toggleStatus(task.id),
                  trailIconButtonOnPressed: () => model.removeTask(task.id));
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.newTask();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
