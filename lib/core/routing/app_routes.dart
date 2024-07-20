import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/networking/api_servcies.dart';
import 'package:todo_task/core/routing/routes_name.dart';
import 'package:todo_task/featuers/home/view/home_screen.dart';
import 'package:todo_task/featuers/login/logic/login_cubit.dart';
import 'package:todo_task/featuers/login/view/login_screen.dart';

class AppRoutes {
  Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
              create: (context) => LoginCubit(ApiServcies()),
              child: const Login());
        });
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      default:
    }
    return null;
  }
}
