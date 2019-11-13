import 'package:flutter/material.dart';

class AppTheme {
  final darkTheme = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: Colors.black,
      brightness: Brightness.dark);

  final lightTheme = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.lightGreen[700],
      primarySwatch: Colors.lightBlue,
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      primaryIconTheme: IconThemeData.fallback().copyWith(
        color: Colors.white,
      ),
      brightness: Brightness.light);
}
