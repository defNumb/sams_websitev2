import 'package:flutter/material.dart';

class CodingTooltip extends StatelessWidget {
  const CodingTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // image from assets
          Image.asset(
            'assets/images/c#logo.png',
            height: 50,
            width: 50,
          ),
          Image.asset(
            'assets/images/Dart_logo.png',
            height: 50,
            width: 50,
          ),
          Image.asset(
            'assets/images/sql_logo.png',
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
