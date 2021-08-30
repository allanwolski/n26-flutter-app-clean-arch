import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  disabledColor: Colors.amber,
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: const Color(0xFF1b1b1b),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 23.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    backwardsCompatibility: false,
  ),
);
