import 'package:flutter/material.dart';

class CustomPlainTextFormField extends StatelessWidget {
  const CustomPlainTextFormField(
      {super.key,
      required this.formHint,
      required this.taskTitleController,
      this.onChanged});

  final String formHint;
  final TextEditingController taskTitleController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: taskTitleController,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.short_text),
        prefixIconColor: Theme.of(context).hintColor.withOpacity(0.4),
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: formHint,
        hintStyle:
            TextStyle(color: Theme.of(context).hintColor.withOpacity(0.3)),
      ),
    );
  }
}
