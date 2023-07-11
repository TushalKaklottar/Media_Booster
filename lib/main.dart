import 'package:flutter/material.dart';
import 'package:media_booster/view/screen/Home_Screen.dart';
import 'package:media_booster/view/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const Splash(),
          'home': (context) => const Home_Screen(),
        },
      )
  );
}