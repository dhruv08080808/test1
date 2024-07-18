import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/own/assignment/postdetail.dart';
import 'package:test1/own/authormodel.dart';

class posts extends StatefulWidget {
  const posts({super.key});

  @override
  State<posts> createState() => _postsState();
}

class _postsState extends State<posts> {


  bool isLoading = false;
  @override
  void initState() {
    getapiposts();
    getapiiposts();
    super.initState();
  }
List<Author>_author=[];
  List? finaldata;
  List? posts;
  late Author listofPost;

  final dio = Dio();
  getapiposts() async {
    final resp = await dio.get('https://jsonplaceholder.typicode.com/users');
   if(resp.statusCode==200){
   // final productjson=json.decode(resp.body)
 setState(() {
   // _author=List<Author>.from(productjson.map((productjson)=>Author.fromJson(productjson)));
    });
   }
   
  }

  getapiiposts() async {
    final respp = await dio.get('https://jsonplaceholder.typicode.com/posts');
    print('${respp.data}');
    setState(() {
      posts = respp.data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          centerTitle: true,
          title: Text('ASSIGNMENT',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber))),
      body: SingleChildScrollView(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Postdetail(passdetails: listofPost.id)));
                    },
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: 
                            isLoading==true?CircularProgressIndicator():
                            Text(
                              listofPost.name.isEmpty?"NO DATA":listofPost.name.trim(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            // subtitle: posts == null
                            //     ? CircularProgressIndicator()
                            //     : Text(posts![i]['body']),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return SizedBox(height: 10);
                        },
                        itemCount: finaldata!.length),
                  )
                ],
              ),
      ),
    );
  }
}
