import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test1/final/postmodel.dart';
import 'package:http/http.dart' as http;
import 'package:test1/own/assignment/posts.dart';
class PostDetailsScreen extends StatefulWidget {
  final String post;

  PostDetailsScreen({required this.post});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
String ?Firsthalf;
String ?Secondhalf;
bool isLoading=false;

  //late List<Comment> _comments;
 List<Post>_postlist=[];
  @override
  void initState() {
    getidapi();
    _postlist=[];
    super.initState();
    
  //  fetchComments();
  }

  // Future<void> fetchComments() async {
  //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.post.id}'));
  //   if (response.statusCode == 200) {
  //     final List<Comment> comments = (jsonDecode(response.body) as List).map((e) => Comment.fromJson(e)).toList();
  //     setState(() {
  //       _comments = comments;
  //     });
  //   } else {
  //     throw Exception('Failed to load comments');
  //   }
  // }

  Future<dynamic>getidapi()async{
       isLoading=true;
    final resp=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.post}'));
    if(resp.statusCode==200){
    // final List<Post> _postdata=(jsonDecode(resp.body)as List).map((e) => Post.fromJson(e)).toList();
           final post = Post.fromJson(jsonDecode(resp.body));
     setState(() {
       _postlist.add(post);
        isLoading=false;
     });
    }else{
      isLoading=false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST DETAILS',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
      ),
      body: 
      isLoading?Center(child: CircularProgressIndicator()):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     widget.post,
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(widget.post),
          // ),
          
          
          // _postlist == null
          //     ? Center(child: CircularProgressIndicator())
          //     : 
              
              
              Expanded(
                  child: ListView.builder(
                    itemCount: _postlist.length,
                    itemBuilder: (context, index) {
                      final posttt = _postlist[index];
                      return ListTile(
                        title: Text(posttt.title),
                        
                        subtitle: Text(posttt.body),
                        isThreeLine: true,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}