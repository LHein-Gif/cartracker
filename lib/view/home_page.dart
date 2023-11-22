import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:cartracker/models/post.dart';
import 'package:cartracker/services/remote_services.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Instruction? instructions;
  var isLoaded = false;
  List<double> geschwindigkeitValues = [];

  @override
  void initState() {
    super.initState();

    //fetch data from API
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      getData();
    });
  }

  getData() async {
    instructions = null;
    try {
      instructions = await RemoteService().getInstruction();
      if (instructions != null) {
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
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
          ),
        ),
      ],
    );
  }
  Widget buildChart() {
    return Container(
      height: 200, // Set the height of the chart here
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: geschwindigkeitValues
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value))
                    .toList(),
                isCurved: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Werte'),
        ),
        body: Visibility(
            visible: isLoaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  buildRow('Name', instructions?.name),
                  buildRow(
                      'Fahrgestellnummer', instructions?.fahrgestellnummer),
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
            )));
  }
}
