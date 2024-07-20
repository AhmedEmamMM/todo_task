import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/helper/extentions.dart';
import 'package:todo_task/core/widgets/my_button.dart';
import 'package:todo_task/featuers/login/data/login_request_model.dart';
import 'package:todo_task/featuers/login/logic/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "User Name",
              hintText: "Enter your username",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter username';
              }
              return null;
            },
          ),
          (screenHeight * 0.03).verticalSpace,
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your pemilysassword",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter password';
              }
              return null;
            },
          ),
          (screenHeight * 0.1).verticalSpace,
          MyButton(
            backGroudcolor: Colors.teal,
            text: "Sign In",
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                      LoginRequestModel(
                        username: usernameController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
