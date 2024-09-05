import 'package:flutter/widgets.dart';
import 'package:presentation/src/components/iicons.dart';
import 'package:presentation/src/extensions/widget_extension.dart';

class Logo extends StatelessWidget {
  Logo({super.key});

  @override
  Widget build(BuildContext context) =>
      context.isDarkMode ? IIcons.logo : IIcons.logoDark;
}
