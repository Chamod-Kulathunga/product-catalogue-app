import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: Colors.grey.shade100,

    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),

    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),

    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
