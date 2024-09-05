import 'package:flutter/widgets.dart';

class Space extends StatelessWidget {
  final double x;
  final double y;

  const Space({
    super.key,
    this.x = 0,
    this.y = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: x,
      height: y,
    );
  }
}
