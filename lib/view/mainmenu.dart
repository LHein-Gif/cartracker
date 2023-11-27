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
  Timer? _colorChangeTimer;

  void ChangeButtonColor() {
    if (mounted) {
      setState(() {
      });
    }

    _colorChangeTimer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
// reset to the original color
        });
      }
    });
  }

  @override
  void dispose() {
    _colorChangeTimer?.cancel();
    super.dispose();
  }

  Color _buttonColor1 = const Color(0xFF424242);
  Color _buttonColor2 = const Color(0xFF424242);

  Widget buildButton(double left, double top, String imageAsset, String text, bool isChartView, int buttonIndex) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (buttonIndex == 1) {
              _buttonColor1 = const Color(0xFFC2C2C2);
            } else if (buttonIndex == 2) {
              _buttonColor2 = const Color(0xFFC2C2C2);
            }
          });

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Homepage(isChartView: isChartView)),
          );

          if (buttonIndex == 1) {
            _colorChangeTimer = Timer(const Duration(seconds: 1), () {
              if (mounted) {
                setState(() {
                  _buttonColor1 = const Color(0xFF424242); // reset to the original color
                });
              }
            });
          } else if (buttonIndex == 2) {
            _colorChangeTimer = Timer(const Duration(seconds: 1), () {
              if (mounted) {
                setState(() {
                  _buttonColor2 = const Color(0xFF424242); // reset to the original color
                });
              }
            });
          }
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
                    color: buttonIndex == 1 ? _buttonColor1 : _buttonColor2,
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageAsset),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: SizedBox(
                  width: 108,
                  height: 20,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Color(0xFFB7B7B7),
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(28, 27, 31, 1000),
      ),
      home: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // Full width
            height: MediaQuery.of(context).size.height,
            // Full height
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0x21514853)),
            child: Stack(
              children: [
                buildButton(22, 259, 'assets/dashboard.png', 'Dashboard', false, 1),
                buildButton(248, 259, 'assets/erweitert.png', 'Erweitert', true, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}