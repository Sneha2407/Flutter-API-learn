import 'package:flutter/material.dart';
import 'package:flutter_api_learn/models/my_api_model.dart';
import 'package:flutter_api_learn/models/posts.dart';
import 'package:flutter_api_learn/models/api_model.dart';

import '../models/register_model.dart';

class PostsProvider with ChangeNotifier {
  List<Post>? _posts = [];
  List<Post>? get posts => _posts;

  RegisterResponse? _registerResponse;
  RegisterResponse? get registerResponse => _registerResponse;

  late Post post1;
  Future<void> fetchMyPosts() async {
    var getResponse =
        await ApiModel.get('https://jsonplaceholder.typicode.com/posts');
    // post1=Post.fromJson(getResponse);
    _posts =
        (getResponse.data as List).map((post) => Post.fromJson(post)).toList();
    notifyListeners();
  }

  //   Future<void> getPosts() async{
  //  var posts= await ApiModel.get('https://jsonplaceholder.typicode.com/posts');
  //  if(posts.statusCode==200){
  //    var jsonString = posts.body;
  //    _posts = postFromJson(jsonString);
  //    notifyListeners();
  //  }
  // }

  //post method for signup
  Future<void> registerUser(
      String name, String email, String city, String place) async {
    var postResponse = await ApiModel.post(
      {
        "email": email,
        "password": city,
        "place": place,
        "name": name,
      },
      'https://fortmindz.co.in/nowOnTheTee_API/public/api/register',
    );
    // if (postResponse.statusCode == 200) {
    //   var jsonString = postResponse.body;
    //   _registerResponse = registerResponseFromJson(jsonString);
    //   notifyListeners();
    // }
    // print("postResponse===>>>${postResponse.data}");
    // notifyListeners();
    try {
      var jsonString = postResponse;
      _registerResponse = registerResponseFromJson(jsonString);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchPosts() async {
    try {
      var response = await MyAPIModel().getPosts();
      _posts = (response as List).map((post) => Post.fromJson(post)).toList();
      post1 = Post.fromJson(response[0]);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  int _index = 0;
  int get index => _index;
  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
