import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Colors.indigo;
  static const whiteBorder = BorderSide(color: Colors.white);
  static const whiteCursorField = Colors.white;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: whiteCursorField),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: UnderlineInputBorder(borderSide: whiteBorder),
          focusedBorder: UnderlineInputBorder(borderSide: whiteBorder)),
      appBarTheme: const AppBarTheme(centerTitle: true, color: colorPrimary));
}
