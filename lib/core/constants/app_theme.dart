import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = Colors.lightGreenAccent])=>OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 5,
    ),
    borderRadius: BorderRadius.circular(12),

  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black12,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(Colors.white54),
      contentPadding: EdgeInsets.all(27.0),
    ),
  );
}