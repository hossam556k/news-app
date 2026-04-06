import 'package:flutter/material.dart';
import 'package:newsapp/core/color-pattles.dart';

class ApplicationThemeManager {
  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 60,
      backgroundColor: ColorPalette.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
