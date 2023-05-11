import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nabu/generated/l10n.dart';
import 'package:nabu/themes/custom_ui.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final l10n = S.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
      ),
      actionsPadding: EdgeInsets.all(CustomUI.xSize(3)),
      actionsOverflowButtonSpacing: CustomUI.xSize(2),
      scrollable: true,
      title: Container(
          padding: EdgeInsets.only(bottom: CustomUI.xSize(3)),
          child: Text(
            l10n.taskDialogTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      content: SizedBox(
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskTitleController,
                decoration: InputDecoration(
                  label: Text(l10n.taskDialogInputTitle,
                      style: TextStyle(overflow: TextOverflow.ellipsis)),
                  prefixIcon: const Icon(
                    CupertinoIcons.square_list,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
                  ),
                ),
              ),
              SizedBox(height: CustomUI.xSize(2)),
              TextFormField(
                controller: taskDescriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  label: Text(l10n.taskDialogInputDescription,
                      style: TextStyle(overflow: TextOverflow.ellipsis)),
                  prefixIcon: const Icon(
                    CupertinoIcons.bubble_left_bubble_right,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(elevation: 2),
          child: Text(l10n.taskDialogCancelButton,
              style: TextStyle(
                  fontSize: CustomUI.xSize(2),
                  overflow: TextOverflow.ellipsis)),
        ),
        FilledButton(
          onPressed: () {
            // final taskTitle = taskTitleController.text;
            // final taskDescription = taskDescriptionController.text;
            // _addTasks(taskTitle: taskTitle, taskDescription: taskDescription);
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(elevation: 2),
          child: Text(l10n.taskDialogSaveButton,
              style: TextStyle(
                  fontSize: CustomUI.xSize(2),
                  overflow: TextOverflow.ellipsis)),
        ),
      ],
    );
  }

  // Future _addTasks({
  //   required String taskTitle,
  //   required String taskDescription,
  // }) async {
  //   await Supabase.instance.client.from('tasks').insert({
  //     "task_title": taskTitle,
  //     "task_description": taskDescription,
  //   });

  //   taskTitleController.text = '';
  //   taskDescriptionController.text = '';
  // }
}
