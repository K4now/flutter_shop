import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blueGrey[100],
    scaffoldBackgroundColor: Colors.blueGrey[50],
    colorScheme: ColorScheme.light(
      primary: Colors.blueGrey[300]!,
      secondary: Colors.teal[300]!,
    ),
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[100],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.teal[300]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[300],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.blueGrey[900],
    scaffoldBackgroundColor: Colors.blueGrey[800],
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey[700]!,
      secondary: Colors.teal[200]!,
    ),
    textTheme: _darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[900],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.teal[200]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[200],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(color: Colors.blueGrey[900]),
    titleLarge: TextStyle(color: Colors.blueGrey[700]),
    bodyLarge: TextStyle(color: Colors.blueGrey[700]),
    bodyMedium: TextStyle(color: Colors.blueGrey[500]),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headlineLarge: TextStyle(color: Colors.blueGrey[50]),
    titleLarge: TextStyle(color: Colors.blueGrey[200]),
    bodyLarge: TextStyle(color: Colors.blueGrey[200]),
    bodyMedium: TextStyle(color: Colors.blueGrey[400]),
  );
}
