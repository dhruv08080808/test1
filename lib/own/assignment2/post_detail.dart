import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test1/own/assignment2/postsmodel.dart';

class Postdetail extends StatefulWidget {
 
  const Postdetail({super.key, required this.userposts});
 final  userposts;
  @override
  State<Postdetail> createState() => _PostdetailState();
}

class _PostdetailState extends State<Postdetail> {
  final dio = Dio();
  List? postdetailss;
  getpostdetailsapi() async {
    final res = await dio.get('https://jsonplaceholder.typicode.com/users/${widget.userposts}');
    print('${res.data}');
    setState(() {
      postdetailss = res.data;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
body: Column(children: [Expanded(
        child: FutureBuilder(future:getpostdetailsapi() , builder: (context,snapshot){
          if(!snapshot.hasData){
            return Text('Loading');
          }else{
            return ListView.separated(
              itemBuilder: (context,i){
              return ListTile(
                title: GestureDetector(
                  // onTap: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Postdetail(userposts:PostsModel.fromJson(i))));
                  // },
                  child: Text(postdetailss![i])),
              );
            }, separatorBuilder: (context,i){
              return SizedBox(height: 15);
            }, itemCount: postdetailss!.length);
          }
        }),
      )],),
    );
  }
}