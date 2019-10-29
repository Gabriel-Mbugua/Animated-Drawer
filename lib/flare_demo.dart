import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_tutorial/smart_flare_animation.dart';
import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';
import 'smart_flare_animation.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var animationHeight = 295.0;
    var animationWidth = 251.0;

    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight = animationHeight / 2;  

    var activeAreas = [

      //top left area
      ActiveArea(
        area: Rect.fromLTWH(0, 0, animationWidthThirds, halfAnimationHeight),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped'
      ),

      //top middle area
      ActiveArea(
        area: Rect.fromLTWH(animationWidthThirds, 0, animationWidthThirds, halfAnimationHeight),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'pulse_tapped'
      ),

      //top right area
      ActiveArea(
        area: Rect.fromLTWH(animationWidthThirds * 2, 0, animationWidthThirds, halfAnimationHeight),
        // debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped'
      ),


      ActiveArea(
          area: Rect.fromLTWH(
            0,
            animationHeight / 2,
            animationWidth,
            animationHeight / 2,
          ),
          // debugArea: true,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print("Toggle Animation");
          }),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 18, 222),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareActor(
          width: animationWidth,
          height: animationHeight,
          filename: 'assets/button-animation.flr',
          startingAnimation: 'deactivate',
          activeAreas: activeAreas,
        ),
      ),
    );
  }
}
