import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey[600]!,
    brightness: Brightness.light,
    primary: Colors.grey[600]!,
    secondary: Colors.grey[500],
    surface: Colors.grey[300]!,
    inverseSurface: Colors.white,
    inversePrimary: Colors.grey[900],
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey[900]!,
    brightness: Brightness.dark,
    primary: Colors.grey[200]!,
    secondary: Colors.grey[300],
    surface: Colors.grey[900]!,
    inverseSurface: Colors.grey[800],
    inversePrimary: Colors.grey[200],
  ),
);
