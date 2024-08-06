import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      foregroundColor: black,
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    switchTheme: SwitchThemeData(
      trackColor: WidgetStatePropertyAll(lightPrimary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    appBarTheme: AppBarTheme(
      foregroundColor: gold,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gold,
      ),
    ),
  );
}
