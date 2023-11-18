
import 'package:cartracker/models/post.dart';
import 'package:http/http.dart' as http;
class RemoteService{
  Future<Instruction>? getInstruction() async
  {
    var client = http.Client();

    var uri = Uri.parse('http://10.0.2.2:8080/messwerte');
    var response = await client.get(uri);
      print(response.body);
      return Instruction.fromRawJson(response.body);
  }
}