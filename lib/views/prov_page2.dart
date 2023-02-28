import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/posts.dart';
import '../provider/posts_provider.dart';
class ProvPage2 extends StatefulWidget {
  const ProvPage2({super.key});

  @override
  State<ProvPage2> createState() => _ProvPage2State();
}

class _ProvPage2State extends State<ProvPage2> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ProvPage2"),
      ),
      body: Center(
        child: ListTile(
                    title: Text(postProvider.posts![postProvider.index].title),
                    subtitle: Text(postProvider.posts![postProvider.index].body??""),
                  )
      ),
    );
  }
}