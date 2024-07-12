import 'package:flutter/widgets.dart';

import '../theme_data.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: whiteColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}