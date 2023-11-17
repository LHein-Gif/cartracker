import 'package:cartracker/models/post.dart';
import 'package:cartracker/services/remote_services.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Instruction>? instructions;
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
        title: Text('Werte'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: instructions?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(instructions![index].name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                )),
              );
            },
        ),
        replacement: const Center(child: CircularProgressIndicator(),
        ),
      )
    );
  }
}