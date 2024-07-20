// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_task/core/helper/extentions.dart';
import 'package:todo_task/core/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController userIDController;
  final TextEditingController todoController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.userIDController,
    required this.todoController,
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
              controller: userIDController,
              decoration: const InputDecoration(
                labelText: "User ID",
                hintText: "Enter User ID",
              ),
            ),
            5.verticalSpace,
            const Text('User ID is : 7051188'),
            15.verticalSpace,
            TextFormField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: "TODO",
                hintText: "Enter New TODO",
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
