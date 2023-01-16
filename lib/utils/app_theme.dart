import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData() {
    return ThemeData(
        primaryColor: const Color(0xFFF50000),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontFamily: 'Biotif', color: Colors.black),
          headlineSmall: TextStyle(fontFamily: 'Biotif', color: Colors.grey),
        ),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        )));
  }
}
