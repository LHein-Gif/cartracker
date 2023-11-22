import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cartracker/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'schlip schlop',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/logo_icoon.png'),
          const Text(
            'Cartracker',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.black12,
      nextScreen: const Homepage(),
      splashIconSize: 307,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
