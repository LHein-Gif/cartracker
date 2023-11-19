import 'dart:async';

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

  @override
  void initState() {
    super.initState();

    //fetch data from API
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      getData();
    });
  }

  getData() async {
    instructions = null;
    try {
      instructions = await RemoteService().getInstruction();
      switch (instructions) {
        case null:
          setState(() {
            isLoaded = false;
          });
        case != null:
          setState(() {
            isLoaded = true;
          });
      }
    } on Exception catch (_) {
      setState(() {
        isLoaded = false;
      });
    }
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Name: ${instructions?.name}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Fahrgestellnummer: ${instructions?.fahrgestellnummer}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Geschwindigkeit: ${instructions?.geschwindigkeit}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Drehzahl: ${instructions?.drehzahl}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Kilometerstand: ${instructions?.kmStand}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Motortemp: ${instructions?.motorTemperatur}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Ladedruck: ${instructions?.ladedruck}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Öldruck: ${instructions?.oeldruck}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Spritverbrauch: ${instructions?.spritVerbrauch}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Tankfüllstand: ${instructions?.tankfuellstand}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ))
                    ],
                  )
                ],
              ),
            )));
  }
}
