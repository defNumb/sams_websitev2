import 'package:flutter/material.dart';

import '../animated_widgets/delayed_animation.dart';

Widget smallNavMenu(double screenWidth, double screenHeight) {
  return Positioned(
    top: screenHeight / 8,
    right: screenWidth / 8,
    child: const DelayedAnimation(
      delay: Duration(milliseconds: 300),
      child: Icon(
        Icons.menu,
        size: 40,
        color: Colors.white,
      ),
    ),
  );
}
