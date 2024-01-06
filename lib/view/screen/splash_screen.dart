import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade500,
              Colors.pink.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(seconds: 1),
            splashIconSize: 200,
            splash:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Icon(
                  Icons.music_note_rounded,
                  size: 100,
                  color: Colors.white,
                ),
    ]
        ),
            nextScreen:  HomeScreen(),
      ),
      )
    );
  }
}
