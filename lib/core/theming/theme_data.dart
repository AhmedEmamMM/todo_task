import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade300,
    appBarTheme: appBarTheme(),
    // for textfield
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  // custom style for using it more than once
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.grey.shade600),
    gapPadding: 10,
  );
  // custom style for using it more than once
  var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.teal, width: 2),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelStyle: const TextStyle( color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
    labelStyle: const TextStyle( color: Colors.teal, fontSize: 22, fontWeight: FontWeight.w900),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedBorder,
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Color(0xFF888888), fontSize: 18),
    elevation: 0,
    centerTitle: true,
  );
}
