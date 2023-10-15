import 'package:flutter/material.dart';

import '../animated_widgets/delayed_animation.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late bool isHovering1 = false;
  late bool isHovering2 = false;
  late bool isHovering3 = false;
  late bool isHovering4 = false;

  @override
  Widget build(BuildContext context) {
    // screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    // screen height
    final double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeight /
          8, // Adjust this value to position the AppBar from the top
      right: screenWidth / 8,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.transparent, // Or any other color for the background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovering1 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovering1 = false;
                });
              },
              child: DelayedAnimation(
                key: widget.key,
                delay: const Duration(milliseconds: 0),
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 100),
                    style: TextStyle(
                      color: isHovering1 ? Colors.white : Colors.white,
                      fontSize: isHovering1 ? 23 : 20,
                      fontFamily: 'MontBlanc',
                      shadows: [
                        isHovering1
                            ? const Shadow(
                                blurRadius: 5.0,
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                              )
                            : const Shadow(
                                blurRadius: 10.0,
                                color: Colors.transparent,
                                offset: Offset(5.0, 5.0),
                              ),
                      ],
                      fontWeight:
                          isHovering1 ? FontWeight.w100 : FontWeight.w400,
                    ),
                    child: const Text(
                      'Home',
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovering2 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovering2 = false;
                });
              },
              child: DelayedAnimation(
                delay: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 100),
                    style: TextStyle(
                      color: isHovering2 ? Colors.blue : Colors.white,
                      fontSize: isHovering2 ? 23 : 20,
                      fontFamily: 'MontBlanc',
                      fontWeight:
                          isHovering2 ? FontWeight.w100 : FontWeight.w400,
                    ),
                    child: const Text(
                      'About Me',
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovering3 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovering3 = false;
                });
              },
              child: DelayedAnimation(
                delay: const Duration(milliseconds: 1000),
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 100),
                    style: TextStyle(
                      color: isHovering3 ? Colors.blue : Colors.white,
                      fontSize: isHovering3 ? 23 : 20,
                      fontFamily: 'MontBlanc',
                      fontWeight:
                          isHovering3 ? FontWeight.w100 : FontWeight.w400,
                    ),
                    child: const Text(
                      'Experience',
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovering4 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovering4 = false;
                });
              },
              child: DelayedAnimation(
                delay: const Duration(milliseconds: 1500),
                child: GestureDetector(
                  onDoubleTap: () {},
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 100),
                    style: TextStyle(
                      color: isHovering4 ? Colors.blue : Colors.white,
                      fontSize: isHovering4 ? 23 : 20,
                      fontFamily: 'MontBlanc',
                      fontWeight:
                          isHovering4 ? FontWeight.w100 : FontWeight.w400,
                    ),
                    child: const Text(
                      'Projects',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
