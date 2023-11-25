import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cartracker/view/home_page.dart';

void main() {
  runApp(const MainMenu());
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});
@override
_MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Color _buttonColor = const Color(0xFF424242);
  Timer? _colorChangeTimer;

  void ChangeButtonColor() {
    if (mounted) {
      setState(() {
        _buttonColor = const Color(0xFFC2C2C2);
      });
    }

    _colorChangeTimer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _buttonColor = const Color(0xFF424242); // reset to the original color
        });
      }
    });
  }

  @override
  void dispose() {
    _colorChangeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width, // Full width
            height: MediaQuery.of(context).size.height, // Full height
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color (0xFF282828)),
            child: Stack(
              children: [
                Positioned(
                  left: 22,
                  top: 259,
                  child: GestureDetector(
                    onTap: () {
                      ChangeButtonColor();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage(isChartView: false)),
                      );
                    },
                    child: SizedBox(
                      width: 141,
                      height: 141,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 141,
                              height: 141,
                              decoration: ShapeDecoration(
                                color: _buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 22,
                            top: 22,
                            child: Container(
                              width: 97,
                              height: 97,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/dashboard.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 16,
                            top: 107,
                            child: SizedBox(
                              width: 108,
                              height: 25,
                              child: Text(
                                'Dashboard',
                                style: TextStyle(
                                  color: Color(0xFFB7B7B7),
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 248,
                  top: 259,
                  child: GestureDetector(
                    onTap: () {
                      ChangeButtonColor();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage(isChartView: true)),
                      );
                    },
                    child: SizedBox(
                      width: 141,
                      height: 141,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 141,
                              height: 141,
                              decoration: ShapeDecoration(
                                color: _buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 9,
                            child: Container(
                              width: 123,
                              height: 123,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/erweitert.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 23,
                            top: 107,
                            child: SizedBox(
                              width: 96,
                              height: 25,
                              child: Text(
                                'Erweitert',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFB7B7B7),
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
