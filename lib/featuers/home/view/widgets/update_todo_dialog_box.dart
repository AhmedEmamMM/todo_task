// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_task/core/helper/extentions.dart';
import 'package:todo_task/core/widgets/my_button.dart';
import 'package:todo_task/featuers/home/data/todo.dart';

class UpdateTodoDialogBox extends StatelessWidget {
  final TODO currentTodo;
  final TextEditingController titleController;
  final TextEditingController statusController;
  VoidCallback onSave;
  VoidCallback onCancel;

  UpdateTodoDialogBox({
    super.key,
    required this.currentTodo,
    required this.titleController,
    required this.statusController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade300,
      content: SizedBox(
        width: widthOfTheScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            25.verticalSpace,
            // get user input
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "title",
                hintText: currentTodo.title,
              ),
            ),
            25.verticalSpace,
            TextFormField(
              controller: statusController,
              decoration: InputDecoration(
                labelText: "Status",
                hintText: currentTodo.status,
              ),
            ),
            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  minWidth: 120,
                  text: 'Save',
                  onPressed: onSave,
                  backGroudcolor: Colors.teal,
                ),
                MyButton(
                  minWidth: 120,
                  text: 'Cancel',
                  onPressed: onCancel,
                  backGroudcolor: Colors.teal,
                ),
              ],
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
