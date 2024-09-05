import 'package:flutter/material.dart';
import 'package:presentation/src/components/logo.dart';

class AAppBar {
  static PreferredSizeWidget get onlyLogoAppBar => AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 90,
        leading: Container(
          padding: const EdgeInsets.only(left: 24),
          child: Logo(),
        ),
      );

  static PreferredSizeWidget onlyTitleAppBar({required String title}) => AppBar(
        // backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(title),
      );
}
