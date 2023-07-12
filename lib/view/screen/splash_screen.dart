import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
            nextScreen: const Home_Screen(),
      ),
      )
    );
  }
}
