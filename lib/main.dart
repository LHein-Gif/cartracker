import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cartracker/view/mainmenu.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'schlip schlop',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0x21514853),
      ),
      home: const SplashScreen(),
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 1, // 50% of screen width
            height: MediaQuery.of(context).size.height * 0.28, // 28% of screen height
            child: Image.asset('assets/logo_icoon.png'),
          ),
          const Text(
            'Cartracker',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.black12,
      nextScreen: const MainMenu(),
      splashIconSize: 307,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
