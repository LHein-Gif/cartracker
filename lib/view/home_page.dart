import 'package:cartracker/models/post.dart';
import 'package:cartracker/services/remote_services.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  Instruction? instructions;
  var isLoaded = false;
  @override
  void initState(){
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async{
   instructions = await RemoteService().getInstruction();
   if(instructions != null){
     setState(() {
       isLoaded = true;
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
        replacement: const Center(child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Text('Name: ${instructions!.name}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold) )
              ],),
              Row(children: [
                Text('fahrgestellnummer: ${instructions!.fahrgestellnummer}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 20, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Geschwindigkeit: ${instructions!.geschwindigkeit}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Drehzahl: ${instructions!.drehzahl}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],)
              ,
              Row(children: [
                Text('Kilometerstand: ${instructions!.kmStand}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Motortemp: ${instructions!.motorTemperatur}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Ladedruck: ${instructions!.ladedruck}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Öldruck: ${instructions!.oeldruck}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Spritverbrauch: ${instructions!.spritVerbrauch}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],),
              Row(children: [
                Text('Tankfüllstand: ${instructions!.tankfuellstand}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 25, fontWeight: FontWeight.bold))
              ],)
            ],
          ),
        )
      )
    );
  }
}