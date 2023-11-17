import 'package:cartracker/models/post.dart';
import 'package:http/http.dart' as http;
class RemoteService{
  Future<List<Instruction>?>? getInstruction() async
  {
    var client = http.Client();

    var uri = Uri.parse('localhost:8080/messwerte');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    }
  }
}