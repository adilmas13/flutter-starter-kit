import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
        if (state.contains(WidgetState.disabled)) {
          return const Color.fromARGB(255, 123, 123, 123);
        } else {
          return const Color.fromARGB(255, 187, 107, 217);
        }
      }),
      foregroundColor: const WidgetStatePropertyAll(
        Colors.white,
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
        if (state.contains(WidgetState.disabled)) {
          return const Color.fromARGB(255, 123, 123, 123);
        } else {
          return const Color.fromARGB(255, 187, 107, 217);
        }
      }),
      foregroundColor: const WidgetStatePropertyAll(
        Colors.white,
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
