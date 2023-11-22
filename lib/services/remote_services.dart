import 'dart:async';
import 'package:cartracker/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Instruction> getInstruction() async {
    var client = http.Client();
    // var uri = Uri.parse('http://192.168.178.46:8080/messwerte'); //for phone
    var uri = Uri.parse('http://10.0.2.2:8080/messwerte'); //for emulator
    var response =
        await client.get(uri).timeout(const Duration(milliseconds: 3000));
    return Instruction.fromRawJson(response.body);
  }
}
