import 'package:flutter/material.dart';

import '../../themes/custom_ui.dart';

class MockupTaskListTile extends StatelessWidget {
  const MockupTaskListTile({
    super.key,
    required this.width,
    required this.tileTitleText,
  });

  final double width;
  final String tileTitleText;

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
        child: Container(
          height: 100,
          width: width,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(CustomUI.xSize(2)),
          ),
          padding: EdgeInsets.only(bottom: CustomUI.xSize(2)),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            iconColor: Theme.of(context).colorScheme.background,
            contentPadding: EdgeInsets.symmetric(
              horizontal: CustomUI.xSize(1),
            ),
            title: TextField(
              expands: true,
              maxLines: null,
              controller: TextEditingController(text: tileTitleText),
              decoration: null,
              cursorColor: Theme.of(context).colorScheme.background,
              readOnly: true,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            leading: Checkbox(
              splashRadius: 0,
              value: false,
              onChanged: null,
              fillColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.background),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.horizontal_rule),
              disabledColor: Theme.of(context).colorScheme.background,
              onPressed: null,
            ),
          ),
        ));
  }
}
