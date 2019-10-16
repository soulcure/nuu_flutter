/*
 * author: Created by 李卓原 on 2018/10/30.
 * email: zhuoyuan93@gmail.com
 *
 */
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
