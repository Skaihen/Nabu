import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nabu/generated/l10n.dart';
import 'package:nabu/themes/custom_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController taskNameController = TextEditingController();

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
            l10n.newTask,
            style: TextStyle(
              fontSize: CustomUI.xSize(4),
              fontWeight: FontWeight.w800,
            ),
          )),
      content: SizedBox(
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                decoration: InputDecoration(
                  label: Text(l10n.title,
                      style: TextStyle(overflow: TextOverflow.ellipsis)),
                  prefixIcon: const Icon(
                    CupertinoIcons.square_list,
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
          style: ElevatedButton.styleFrom(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
              ),
              minimumSize: Size(width, CustomUI.xSize(7))),
          child: Text(l10n.cancel,
              style: TextStyle(
                  fontSize: CustomUI.xSize(2),
                  overflow: TextOverflow.ellipsis)),
        ),
        FilledButton(
          onPressed: () {
            final taskName = taskNameController.text;
            _addTasks(taskName: taskName);
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
              ),
              minimumSize: Size(width, CustomUI.xSize(7))),
          child: Text(l10n.save,
              style: TextStyle(
                  fontSize: CustomUI.xSize(2),
                  overflow: TextOverflow.ellipsis)),
        ),
      ],
    );
  }

  Future _addTasks({
    required String taskName,
  }) async {
    await Supabase.instance.client.from('tasks').insert({
      "task_name": taskName,
    });

    taskNameController.text = '';
  }
}
