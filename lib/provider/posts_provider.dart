import 'package:flutter/material.dart';
import 'package:flutter_api_learn/models/my_api_model.dart';
import 'package:flutter_api_learn/models/posts.dart';
import 'package:flutter_api_learn/models/api_model.dart';

class PostsProvider with ChangeNotifier {
  List<Post>? _posts = [];
  List<Post>? get posts => _posts;

  // Post post1=Post();
  // Future<void> fetchMyPosts() async {
  //   var getResponse = await ApiModel.get('https://jsonplaceholder.typicode.com/posts');
  //   post1=Post.fromJson(getResponse);
  //   notifyListeners();
  // }

    Future<void> getPosts() async{
   var posts= await ApiModel.get('https://jsonplaceholder.typicode.com/posts');
   if(posts.statusCode==200){
     var jsonString = posts.body;
     _posts = postFromJson(jsonString);
     notifyListeners();
   }
  }
   Future<void> fetchPosts() async {
    try {
      final response = await MyAPIModel().getPosts();
      _posts = (response.data as List).map((post) => Post.fromJson(post)).toList();
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
  int _index=0;
  int get index=>_index;
  void changeIndex(int index){
    _index=index;
    notifyListeners();
  }

}