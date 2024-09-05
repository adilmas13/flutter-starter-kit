import 'package:flutter/material.dart';
import 'package:presentation/src/theme/elevated_button_theme.dart';
import 'package:presentation/src/theme/input_decoration_theme.dart';
import 'package:presentation/src/theme/outline_button_theme.dart';
import 'package:presentation/src/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
    textTheme: TTextTheme.lightTheme,
    inputDecorationTheme: TInputDecorationTheme.lightTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightTheme,
    primaryColor: const Color.fromARGB(255, 187, 107, 217),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color.fromARGB(255, 12, 17, 29),
    textTheme: TTextTheme.darkTheme,
    inputDecorationTheme: TInputDecorationTheme.darkTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkTheme,
    primaryColor: const Color.fromARGB(255, 187, 107, 217),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 12, 17, 29),
    ),
  );
}
