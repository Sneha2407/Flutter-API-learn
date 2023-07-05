import 'package:flutter/material.dart';
import 'package:flutter_api_learn/views/prov_page1.dart';
import 'package:flutter_api_learn/views/prov_page3.dart';
import 'views/home_page.dart';
import 'provider/posts_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: ProvPage1(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
