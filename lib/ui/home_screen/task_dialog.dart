import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../themes/custom_ui.dart';
import '../../widgets/custom_text_form_field.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController taskTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final l10n = S.of(context);

    return AlertDialog(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(l10n.taskDialogInputTitle,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              CustomTextFormField(taskTitleController: taskTitleController),
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
