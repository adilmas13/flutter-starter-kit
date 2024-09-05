import 'package:flutter/material.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 14),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
    ),
  );

  static OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(const Color.fromARGB(255, 9, 9, 11)),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 250, 250, 250),
            fontWeight: FontWeight.w500),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(255, 63, 63, 70)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
    ),
  );
}
