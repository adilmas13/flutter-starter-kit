import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IIcons {
  static Image google = Image(
    width: 16,
    height: 16,
    image: AssetImage('assets/icons/google_icon.png'),
  );

  static Image apple = Image(
    width: 16,
    height: 16,
    image: AssetImage('assets/icons/apple_icon.png'),
  );

  static SvgPicture logo = SvgPicture.asset(
    'assets/icons/logo.svg',
  );

  static SvgPicture logoDark = SvgPicture.asset(
    'assets/icons/logo_dark.svg',
  );
}
