import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/own/assignment2/post_detail.dart';
import 'package:test1/own/assignment2/postsmodel.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postlist = [];
  Future<List<PostsModel>> getapi() async {
    final resp =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(resp.body.toString());
    if (resp.statusCode == 200) {
      for (Map i in data) {
        postlist.add(PostsModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API FROM DATA')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.separated(
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Postdetail(
                                              userposts: postlist[i])));
                                },
                                child: Text(postlist[i].body.toString())),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return SizedBox(height: 15);
                        },
                        itemCount: postlist.length);
                  }
                }),
          )
        ],
      ),
    );
  }
}
