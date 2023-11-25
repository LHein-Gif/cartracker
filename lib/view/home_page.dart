import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:cartracker/models/post.dart';
import 'package:cartracker/services/remote_services.dart';
import 'package:flutter/material.dart';

import '../ValuePainter.dart';

class Homepage extends StatefulWidget {
  final bool isChartView;

  const Homepage({super.key, this.isChartView = false});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Instruction? instructions;
  var isLoaded = false;
  List<double> geschwindigkeitValues = [];
  int totalDataPoints = 0;
  double minY =
      double.infinity; // New variable to keep track of minimum y-value
  double maxY =
      double.negativeInfinity; // New variable to keep track of maximum y-value
  bool isChartView = false;
  Timer? _Beamngtimer;

  @override
  void dispose() {
    _Beamngtimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isChartView = widget.isChartView;

    //fetch data from API
    _Beamngtimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      getData();
    });
  }

  getData() async {
    instructions = null;
    try {
      instructions = await RemoteService().getInstruction();
      if (instructions != null) {
        if (geschwindigkeitValues.length >= 16) {
          geschwindigkeitValues.removeAt(0);
        }
        geschwindigkeitValues.add(instructions!.geschwindigkeit.toDouble());
        setState(() {
          isLoaded = true;
        });
      } else {
        setState(() {
          isLoaded = false;
        });
      }
    } on Exception catch (_) {
      setState(() {
        isLoaded = false;
      });
    }
  }

  Widget buildRow(String title, dynamic value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$title: $value',
            style: const TextStyle(
                color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  Widget buildChart() {
    final spots = geschwindigkeitValues
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();
try {
  return SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    return value.toString();
                  },
                ),
                show: true,
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: false,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
          CustomPaint(
            size: Size.infinite,
            painter: ValuePainter(geschwindigkeitValues, spots),
          ),
        ],
      ),
    ),
  );
} catch (e) {
  return const Center(child: CircularProgressIndicator());
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Werte'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                if (result == 'Current View') {
                  isChartView = false;
                } else if (result == 'Chart View') {
                  isChartView = true;
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Current View',
                child: Text('Current View'),
              ),
              const PopupMenuItem<String>(
                value: 'Chart View',
                child: Text('Chart View'),
              ),
            ],
          ),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: isChartView ? buildChart() : buildCurrentView(),
      ),
    );
  }

  Widget buildCurrentView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          buildRow('Name', instructions?.name),
          buildRow('Fahrgestellnummer', instructions?.fahrgestellnummer),
          buildRow('Geschwindigkeit', instructions?.geschwindigkeit),
          buildRow('Drehzahl', instructions?.drehzahl),
          buildRow('Kilometerstand', instructions?.kmStand),
          buildRow('Motortemp', instructions?.motorTemperatur),
          buildRow('Ladedruck', instructions?.ladedruck),
          buildRow('Öldruck', instructions?.oeldruck),
          buildRow('Spritverbrauch', instructions?.spritVerbrauch),
          buildRow('Tankfüllstand', instructions?.tankfuellstand),
          buildChart(),
        ],
      ),
    );
  }
}
