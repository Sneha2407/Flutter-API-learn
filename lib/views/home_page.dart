// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '/models/posts.dart';
import '/services/remote_services.dart';
import '/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Posts')),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                            style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                          ),
                          Text(posts![index].body ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              // style:
                              //     TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                              ),
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
