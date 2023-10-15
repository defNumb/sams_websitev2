import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_websitev2/animated_widgets/delayed_animation.dart';
import 'package:sams_websitev2/ui_elements/side_bar.dart';
import 'package:sams_websitev2/ui_elements/small_nav_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'blocs/selected_app_bar_button/selected_app_bar_button_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // is hovering
  bool isHovering = false;
  List<Widget> homePageWidgetList(double screenWidth, double screenHeight) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(screenWidth / 8, screenHeight / 8, 0, 0),
            child: DelayedAnimation(
              delay: const Duration(milliseconds: 1000),
              child: Text(
                'Sam\nEspinoza',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 700 ? screenWidth / 15 : 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0.9),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight > 700 ? 30 : 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(screenWidth / 8, 0, 0, 0),
            child: DelayedAnimation(
              delay: const Duration(milliseconds: 1100),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'Hi, I am a ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth > 700 ? screenWidth / 70 : 12,
                          fontFamily: 'MontBlanc',
                          fontWeight: FontWeight.w300,
                          height: 0.9),
                    ),
                    MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            isHovering = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHovering = false;
                          });
                        },
                        child: AnimatedDefaultTextStyle(
                          style: TextStyle(
                              color: isHovering
                                  ? const Color.fromARGB(255, 20, 69, 228)
                                  : Colors.white,
                              fontSize:
                                  screenWidth > 700 ? screenWidth / 50 : 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0.9),
                          duration: const Duration(milliseconds: 200),
                          child: const Text('Software'),
                        )),
                    Text(
                      ' Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth > 700 ? screenWidth / 80 : 12,
                          fontFamily: 'MontBlanc',
                          fontWeight: FontWeight.w300,
                          height: 0.9),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // richtext 'based in kansas city'
          Padding(
            padding: EdgeInsets.fromLTRB(screenWidth / 8, 0, 0, 0),
            child: DelayedAnimation(
              delay: const Duration(milliseconds: 1200),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'Based in ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth > 700 ? screenWidth / 80 : 15,
                          fontFamily: 'MontBlanc',
                          fontWeight: FontWeight.w300,
                          height: 0.9),
                    ),
                    Text(
                      'Kansas City',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth > 700 ? screenWidth / 70 : 15,
                          fontFamily: 'MontBlanc',
                          fontWeight: FontWeight.w600,
                          height: 0.9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  bool isScrollingProgrammatically = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  void _updatePage(int index) {
    isScrollingProgrammatically = true; // Set the flag to true before scrolling
    itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic)
        .then((_) {
      // After scrolling is done, reset the flag
      Future.delayed(const Duration(milliseconds: 300)).then((_) {
        isScrollingProgrammatically = false;
      });
    });
  }

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() {
      if (!isScrollingProgrammatically) {
        int index = itemPositionsListener.itemPositions.value
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .toList()[0]
            .index;
        context.read<SelectedAppBarButtonCubit>().updateSelectedButton(index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    itemScrollController;
    scrollOffsetController;
    itemPositionsListener;
    scrollOffsetListener;
    super.dispose();
  }

  // screen coordinates variable
  Alignment _gradientCenter = Alignment.center;
  @override
  Widget build(BuildContext context) {
    /*
    *
    *
     DEVICE SCREEN SIZE VARIABLES
     *
     */
    // screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    // screen height
    final double screenHeight = MediaQuery.of(context).size.height;
    // END OF DEVICE SCREEN SIZE VARIABLES

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MouseRegion(
        onHover: (event) {
          // set state to update the offset
          setState(() {
            _gradientCenter = Alignment(
              2 * (event.localPosition.dx / MediaQuery.of(context).size.width) -
                  1,
              2 *
                      (event.localPosition.dy /
                          MediaQuery.of(context).size.height) -
                  1,
            );
          });
        },
        child: Stack(
          children: [
            // BACKGROUND IMAGE With animated gradient
            Container(
              // The background image is a gradient that goes from top to bottom.
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.3,
                  center: _gradientCenter,
                  stops: const [0.0, 1.0],
                  colors: const [
                    Color.fromARGB(255, 26, 40, 66),
                    Color.fromARGB(255, 24, 6, 27),
                  ],
                ),
              ),
            ),
            // SIDE BAR
            screenWidth > 700
                ? const SideBar()
                : smallNavMenu(screenWidth, screenHeight),

            /* THIS IS THE CONTENT OF THE WEBISTE,
               MAKE SURE ITS SCROLLABLE 
            */
            SizedBox(
              width: screenWidth / 1.5,
              height: screenHeight,
              child: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  scrollOffsetController: scrollOffsetController,
                  scrollOffsetListener: scrollOffsetListener,
                  itemCount:
                      homePageWidgetList(screenWidth, screenHeight).length,
                  itemBuilder: (context, index) {
                    return homePageWidgetList(screenWidth, screenHeight)[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
