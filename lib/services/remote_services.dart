import 'package:flutter_api_learn/main.dart';
import '/models/posts.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if(response.statusCode==200){
      var jsonString = response.body;
      return postFromJson(jsonString);
    }
  }
}
