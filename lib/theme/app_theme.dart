import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(centerTitle: true, color: colorPrimary));
}
