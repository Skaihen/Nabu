import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../generated/l10n.dart';
import '../../themes/custom_ui.dart';
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
          padding: EdgeInsets.symmetric(
              vertical: CustomUI.xSize(1), horizontal: CustomUI.xSize(2)),
          children: [
            if (model.tasks.isEmpty)
              Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    SizedBox(height: CustomUI.xSize(8)),
                    Icon(Icons.emoji_food_beverage_outlined,
                        size: CustomUI.xSize(6)),
                    SizedBox(height: CustomUI.xSize(2)),
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
                updateTaskTitle: (String text) => {
                  if (text.isEmpty)
                    {model.removeTask(task.id)}
                  else
                    {model.updateTaskTitle(task.id, text)}
                },
                toggleCompletedButtonOnChanged: () =>
                    model.toggleStatus(task.id),
                trailIconButtonOnPressed: () => model.removeTask(task.id),
                onTaskTitleCompleted: (String text) {
                  if (task.title.isEmpty) {
                    model.removeTask(task.id);
                  }
                },
              );
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
