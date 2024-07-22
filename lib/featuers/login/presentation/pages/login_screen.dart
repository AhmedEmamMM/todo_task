import 'package:flutter/material.dart';
import 'package:todo_task/featuers/login/presentation/widgets/heading.dart';
import 'package:todo_task/featuers/login/presentation/widgets/login_bloc_listener.dart';
import 'package:todo_task/featuers/login/presentation/widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Spacer(flex: 1),
                  Heading(heading: 'Priority Planner'),
                  Spacer(flex: 1),
                  LoginForm(),
                  Spacer(flex: 2),
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
