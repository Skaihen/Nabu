import 'package:flutter/material.dart';

import '../themes/custom_ui.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.taskTitleController});

  final TextEditingController taskTitleController;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: TextFormField(
        controller: taskTitleController,
      ),
    );
  }
}
