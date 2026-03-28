import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xffD9D9D9),
    primary: Colors.white,
    secondary: const Color.fromARGB(255, 85, 85, 85),
    tertiary: Color(0xFFFFB900)
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 85, 85, 85),
    primary: const Color.fromARGB(255, 58, 58, 58), 
    secondary: const Color.fromARGB(255, 213, 212, 212),
    tertiary: Color(0xFF383838)
  )
);