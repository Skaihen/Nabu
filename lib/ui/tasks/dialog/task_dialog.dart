import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../themes/custom_ui.dart';
import 'custom_text_form_field.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController taskTitleController = TextEditingController();
  String placeholderTileTitleText = '• • •';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final l10n = S.of(context);

    return Center(
      child: Stack(alignment: Alignment.topCenter, children: [
        SizedBox(
            height: CustomUI.xSize(49),
            width: width,
            child: AlertDialog(
              scrollable: true,
              actionsOverflowButtonSpacing: CustomUI.xSize(2),
              title: SizedBox(height: CustomUI.xSize(6)),
              content: SizedBox(
                width: width,
                child: Form(
                    child: Column(children: [
                  CustomTextFormField(
                    formLabel: l10n.taskDialogInputTitle,
                    taskTitleController: taskTitleController,
                    onChanged: (String value) {
                      setState(() {
                        value.isEmpty
                            ? placeholderTileTitleText = '• • •'
                            : placeholderTileTitleText = value;
                      });
                    },
                  ),
                ])),
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
            )),
        // CustomTaskListTile(
        //   placeholderTileTitleText: placeholderTileTitleText,
        //   width: width * 0.66,
        //   isCompleted: false,
        //   trailIconButtonOnPressed: () {},
        //   toggleCompletedButtonOnChanged: (bool? value) {},
        // )
      ]),
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
