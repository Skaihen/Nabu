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
      required this.trailIconButtonOnPressed});

  final double width;
  final String tileTitleText;
  final FocusNode? tileFocusNode;
  final bool isCompleted;
  final ValueChanged<String> updateTaskTitle;
  final ValueChanged<bool?> toggleCompletedButtonOnChanged;
  final VoidCallback trailIconButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            height: 100,
            width: width,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade400.withOpacity(0.9),
              borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
            ),
          ),
          Positioned(
            left: 160,
            top: -2,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade300.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: width,
            child: ListTile(
              iconColor: Theme.of(context).colorScheme.background,
              contentPadding: EdgeInsets.symmetric(
                horizontal: CustomUI.xSize(1),
              ),
              title: TextField(
                controller: TextEditingController(text: tileTitleText),
                decoration: null,
                focusNode: tileFocusNode,
                onChanged: updateTaskTitle,
                cursorColor: Theme.of(context).colorScheme.background,
                style: TextStyle(
                    fontSize: CustomUI.xSize(3),
                    color: Theme.of(context).colorScheme.background,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null),
              ),
              leading: Checkbox(
                value: isCompleted,
                onChanged: toggleCompletedButtonOnChanged,
                fillColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.background),
                checkColor: Colors.lightBlue.shade400.withOpacity(0.9),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.horizontal_rule),
                onPressed: trailIconButtonOnPressed,
              ),
            ),
          )
        ],
      ),
    );
  }
}
