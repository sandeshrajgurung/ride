import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'product-sans' ,
      primaryColor: const Color(0xFFF50000),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.grey),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.grey),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFF50000),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
          unselectedItemColor: Colors.black54,
          selectedIconTheme: IconThemeData(
            color: Color(0xFFF50000),
          )),
    );
  }
}
