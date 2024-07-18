import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test1/final/PostDetailsScreen.dart';
import 'package:test1/final/postmodel.dart';
import 'package:http/http.dart' as http;

class HomeScreenn extends StatefulWidget {
  @override
  _HomeScreennState createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
   List<Post> _posts=[]; //model ki list bna li

   List<User> _users=[]; //same model ki list bna li

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _posts=[];
    _users=[];
    fetchPostsAndUsers();
  }

  Future<void> fetchPostsAndUsers() async {
     isLoading=false;
    final postsResponse = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts')); //api call
    final usersResponse = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users')); //api call

    if (postsResponse.statusCode == 200 && usersResponse.statusCode == 200) {
      final List<Post> posts = (jsonDecode(postsResponse.body) as List)
          .map((e) => Post.fromJson(e))
          .toList();
      final List<User> users = (jsonDecode(usersResponse.body) as List)
          .map((e) => User.fromJson(e))
          .toList();

      setState(() {
        _posts = posts;
        _users = users;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
      ),
      body: isLoading==true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                final user =
                    // _users.firstWhere((user) => user.id == post.userId);
                    _users[index];
                return ListTile(
                  title: Text(user.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                  subtitle: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.body +  "....",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.lightGreen),
                      maxLines: 2,
                      ),
                    
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsScreen(post: user.id.toString()),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
