import 'package:dio/dio.dart';
class MyAPIModel{
   final Dio _dio = Dio();
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Object> getPosts() async {
    // Response response;
   var response= await _dio.get('$_baseUrl/posts');
    try{
       if (response.statusCode == 200) {
          print("getting get response ===>>> $response");
          return response.data;
          }
          else {
        return {"code": -999, "desc": "connection failed"};
      }
    } catch (e) {
      print("printing error msg>>>>>>>>>${e.toString()}");
      return {"code": -999, "message": "$_baseUrl|$e"};
    }

    }
    
  }
