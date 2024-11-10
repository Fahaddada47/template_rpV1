import 'package:flutter/material.dart';

import '../styling/app_colors.dart';
import '../styling/text_styles.dart';

class AppThemeData {
  static ThemeData lightThemeData(BuildContext context) => _themeData;

  static final ThemeData _themeData = ThemeData(
      scaffoldBackgroundColor: white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(350, 48),
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: white),
          backgroundColor: carrotOrange,
          padding: const EdgeInsets.symmetric(vertical: 10),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: viridian,
        background: white,
        error: Colors.red,
      ),
      appBarTheme: _appBarTheme,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      dialogTheme:
          const DialogTheme(backgroundColor: white, surfaceTintColor: white));

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 14,
    ),
    toolbarHeight: 64,
    elevation: 0,
    titleTextStyle: TextStyles.heavy22.copyWith(color: black),
    surfaceTintColor: white,
    centerTitle: false,
  );


  static final FloatingActionButtonThemeData _floatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: carrotOrange,
    iconSize: 32,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50)
    )
  );
}
