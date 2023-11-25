// ignore: file_names
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ValuePainter extends CustomPainter {
  final List<double> values;
  final List<FlSpot> spots;

  ValuePainter(this.values, this.spots);

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (var i = 0; i < spots.length; i++) {
      textPainter.text = TextSpan(
        text: values[i].toString(),
        style: const TextStyle(color: Colors.black, fontSize: 10),
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(spots[i].x * size.width, spots[i].y * size.height),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}