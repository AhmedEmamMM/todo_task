import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/routing/routes_name.dart';
import 'package:todo_task/featuers/home/presentation/pages/home_screen.dart';
import 'package:todo_task/featuers/login/data/dataSources/login_api.dart';
import 'package:todo_task/featuers/login/data/repositories_imp/login_repositores_imp.dart';
import 'package:todo_task/featuers/login/presentation/bloc/login_cubit.dart';
import 'package:todo_task/featuers/login/presentation/pages/login_screen.dart';

class AppRoutes {
  Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
              create: (context) => LoginCubit(LoginRepositoresImp(LoginApi())),
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
