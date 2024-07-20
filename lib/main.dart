import 'package:flutter/material.dart';
import 'package:todo_task/core/routing/app_routes.dart';
import 'package:todo_task/core/routing/routes_name.dart';
import 'package:todo_task/core/theming/theme_data.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: RoutesName.loginScreen,
      onGenerateRoute: AppRoutes().onGenerateRoutes,
    );
  }
}
