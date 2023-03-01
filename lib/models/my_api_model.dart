import 'package:dio/dio.dart';
class MyAPIModel{
   final Dio _dio = Dio();
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Response> getPosts() async {
    return await _dio.get('$_baseUrl/posts');
    //trying with my branch
  }
}