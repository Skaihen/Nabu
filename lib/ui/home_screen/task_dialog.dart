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
  String placeholderTileTitleText = '• • •';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final l10n = S.of(context);

    return Center(
      child: Stack(alignment: Alignment.topCenter, children: [
        SizedBox(
            height: CustomUI.xSize(60),
            width: width,
            child: AlertDialog(
              scrollable: true,
              actionsOverflowButtonSpacing: CustomUI.xSize(2),
              title: SizedBox(height: CustomUI.xSize(6)),
              content: SizedBox(
                width: width,
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      TextFormField(
                        onChanged: (String value) {
                          setState(() {
                            placeholderTileTitleText = value;
                          });
                        },
                        controller: taskTitleController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.short_text),
                          prefixIconColor:
                              Theme.of(context).hintColor.withOpacity(0.4),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          hintText: l10n.taskDialogInputTitle,
                          hintStyle: TextStyle(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.3)),
                        ),
                      ),
                      SizedBox(height: CustomUI.xSize(2)),
                      Text(l10n.taskDialogInputTitle,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: CustomUI.xSize(1)),
                      CustomTextFormField(
                          taskTitleController: taskTitleController)
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
        Material(
          elevation: 3,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
          child: Container(
            height: 100,
            width: width * 0.66,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade400.withOpacity(0.9),
              borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
            ),
            child: ListTile(
              title: Text(placeholderTileTitleText),
              titleTextStyle: TextStyle(
                  fontSize: CustomUI.xSize(3),
                  color: Theme.of(context).colorScheme.background),
            ),
          ),
        ),
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
