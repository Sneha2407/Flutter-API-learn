import 'package:flutter/material.dart';
import 'package:flutter_api_learn/views/prov_page2.dart';
import 'package:provider/provider.dart';

import '../models/posts.dart';
import '../provider/posts_provider.dart';
class ProvPage1 extends StatefulWidget {
  const ProvPage1({super.key});

  @override
  State<ProvPage1> createState() => _ProvPage1State();
}

class _ProvPage1State extends State<ProvPage1> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
   final postsProvider = Provider.of<PostsProvider>(context, listen: false);
    postsProvider.fetchPosts();
    setState(() {
      isLoaded = true;
    });
  }
  int ind=0;
  int selectedIndex=0;
  
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostsProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: postProvider.posts!.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postProvider.posts?.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts![index];
                
                // ind=index;
                
                return GestureDetector(
                   onTap: () {
              setState(() {
            selectedIndex=index;
            postProvider.changeIndex(index);

          });
            
          },
                  child: ListTile(
                    title: Text(post.title,style: TextStyle(color: selectedIndex==index? Colors.deepOrange:Colors.black),),
                    subtitle: Text(post.body??"",style: TextStyle(color: selectedIndex==index? Colors.deepOrange:Colors.black),),
                   
                  ),
                );
              }, 
            ),bottomSheet: ElevatedButton(child: Container(height: 40,width: double.infinity, child: Center(child: Text("GO NEXT >>")),),onPressed: (){
            
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProvPage2()));
          },),
    );
  }
}