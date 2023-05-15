import 'package:flutter/material.dart';

import '../../themes/custom_ui.dart';

class CustomTaskListTile extends StatelessWidget {
  const CustomTaskListTile(
      {super.key,
      required this.width,
      required this.tileTitleText,
      required this.tileFocusNode,
      required this.isCompleted,
      required this.updateTaskTitle,
      required this.toggleCompletedButtonOnChanged,
      required this.trailIconButtonOnPressed,
      required this.onTaskTitleCompleted});

  final double width;
  final String tileTitleText;
  final FocusNode? tileFocusNode;
  final bool isCompleted;
  final ValueChanged<String> updateTaskTitle;
  final VoidCallback toggleCompletedButtonOnChanged;
  final VoidCallback trailIconButtonOnPressed;
  final ValueChanged<String> onTaskTitleCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: CustomUI.xSize(1)),
      child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
          child: Container(
            height: 100,
            width: width,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.lightBlue.shade200 : Colors.lightBlue,
              borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
            ),
            child: ListTile(
              iconColor: Theme.of(context).colorScheme.background,
              contentPadding: EdgeInsets.symmetric(
                horizontal: CustomUI.xSize(1),
              ),
              onTap: toggleCompletedButtonOnChanged,
              title: TextField(
                controller: TextEditingController(text: tileTitleText),
                decoration: null,
                focusNode: tileFocusNode,
                onChanged: updateTaskTitle,
                cursorColor: Theme.of(context).colorScheme.background,
                readOnly: isCompleted,
                style: TextStyle(
                  fontSize: CustomUI.xSize(3),
                  color: Theme.of(context).colorScheme.background,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  decorationColor: Theme.of(context).colorScheme.background,
                  decorationThickness: 2,
                ),
              ),
              leading: Checkbox(
                splashRadius: 0,
                value: isCompleted,
                onChanged: null,
                fillColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.background),
                checkColor:
                    isCompleted ? Colors.lightBlue.shade200 : Colors.lightBlue,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.horizontal_rule),
                onPressed: trailIconButtonOnPressed,
              ),
            ),
          )),
    );
  }
}
