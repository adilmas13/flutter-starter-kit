import 'package:flutter/material.dart';

class TInputDecorationTheme {
  TInputDecorationTheme._();

  static InputDecorationTheme lightTheme = const InputDecorationTheme(
    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 100, 116, 139),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color.fromARGB(255, 226, 232, 240)),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );

  static InputDecorationTheme darkTheme = const InputDecorationTheme(
    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 100, 116, 139),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color.fromARGB(255, 226, 232, 240)),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );
}
