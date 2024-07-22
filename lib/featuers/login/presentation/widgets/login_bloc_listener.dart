import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/helper/extentions.dart';
import 'package:todo_task/featuers/home/data/dataSources/api_servcies.dart';
import 'package:todo_task/featuers/home/data/repositories_imp/todo_repositories_imp.dart';
import 'package:todo_task/featuers/home/presentation/bloc/todo_cubit.dart';
import 'package:todo_task/featuers/home/presentation/pages/home_screen.dart';
import 'package:todo_task/featuers/login/presentation/bloc/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            ),
          );
        }
        if (state is LoginSuccess) {
          context.pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<TodoCubit>(
                create: (context) => TodoCubit(TodoRepositoriesImp(ApiServcies()))..getTodos(),
                child: HomeScreen(
                  loginResponesModel: state.loginRespondModel,
                ),
              ),
            ),
          );
        }
        if (state is LoginFailure) {
          setupErrorState(context, "Invalid credentials");
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
