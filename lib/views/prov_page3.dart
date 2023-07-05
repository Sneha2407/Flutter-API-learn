import 'dart:convert';
import 'package:flutter_api_learn/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/posts_provider.dart';

class ProvPage3 extends StatefulWidget {
  const ProvPage3({super.key});

  @override
  State<ProvPage3> createState() => _ProvPage3State();
}

class _ProvPage3State extends State<ProvPage3> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final postsProvider = Provider.of<PostsProvider>(context, listen: false);
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    await postsProvider.registerUser(
        "Sneha", "snehabiswas9719@gmail.com", "Kolkata", "Saltlake");
    // setState(() {
    //   isLoaded = true;
    // });
  }

  String message = "";

  Future<void> postUser(
      String name, String email, String place, String city) async {
    final url = 'https://fortmindz.co.in/nowOnTheTee_API/public/api/register';

    final body = {
      'name': name,
      'email': email,
      'place': place,
      'city': city,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final registerResponse = RegisterResponse.fromJson(jsonResponse);
      setState(() {
        message = registerResponse.message;
      });
      print('Message: ${registerResponse.message}');
      print('Success: ${registerResponse.success}');
      print('Code: ${registerResponse.code}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostsProvider>(context);
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("ProvPage3"),
        ),
        body: Column(
          children: [
            Text(message),
            ElevatedButton(
                onPressed: () {
                  postUser("Sneha", "snehabiswas9719@gmail.com", "Kolkata",
                      "Saltlake");
                },
                child: Text("Register")),
          ],
        ));
  }
}

class RegisterProvider extends ChangeNotifier {
  String? _responseMessage;
  String? get message => _responseMessage;
  //RegisterResponse? get registerResponse => _registerResponse;

  Future<void> postUser(
      String name, String email, String place, String city) async {
    final url = 'https://fortmindz.co.in/nowOnTheTee_API/public/api/register';

    final body = {
      'name': name,
      'email': email,
      'place': place,
      'city': city,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final registerResponse = RegisterResponse.fromJson(jsonResponse);

      _responseMessage = registerResponse.message;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    notifyListeners();
  }
}
