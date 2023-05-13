import 'package:flutter/material.dart';

import '../themes/custom_ui.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.formLabel,
      required this.taskTitleController,
      this.onChanged});

  final String formLabel;
  final TextEditingController taskTitleController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formLabel, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: CustomUI.xSize(1)),
        Material(
          borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.2),
          child: TextFormField(
            controller: taskTitleController,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
