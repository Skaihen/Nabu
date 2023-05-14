import 'package:flutter/material.dart';

import '../../themes/custom_ui.dart';

class CustomTaskListTile extends StatelessWidget {
  const CustomTaskListTile(
      {super.key,
      required this.placeholderTileTitleText,
      required this.width,
      required this.isCompleted,
      required this.trailIconButtonOnPressed,
      required this.toggleCompletedButtonOnChanged});

  final String placeholderTileTitleText;
  final double width;
  final bool isCompleted;
  final VoidCallback trailIconButtonOnPressed;
  final ValueChanged<bool?> toggleCompletedButtonOnChanged;

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
              title: Text(placeholderTileTitleText),
              titleTextStyle: TextStyle(
                  fontSize: CustomUI.xSize(3),
                  color: Theme.of(context).colorScheme.background,
                  decoration: isCompleted ? TextDecoration.lineThrough : null),
              leading: Checkbox(
                value: isCompleted,
                onChanged: toggleCompletedButtonOnChanged,
                fillColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.background),
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
