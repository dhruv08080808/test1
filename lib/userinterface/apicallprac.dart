import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apicallprac extends StatefulWidget {
  const apicallprac({super.key});

  @override
  State<apicallprac> createState() => _apicallpracState();
}

class _apicallpracState extends State<apicallprac> {
  @override
 void initState() {
    
    getdatathoughapi();
    super.initState();
  }
  final dio=Dio();
List?product;
  


   getdatathoughapi()async{
    final resp= await dio.get('https://dummyjson.com/products');
    print('${resp.data}');
    setState(() {
      product=resp.data;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API CALL'),
      elevation: 0,
      backgroundColor: Colors.red,
      
      ),
      body: ListView.separated(itemBuilder: (context,i){
        return ListTile(
leading: Image.network(product![i]['images'][0]),
title: Text(product![i]['title']),
        );
      }, separatorBuilder: (context,i){
        return SizedBox(height: 10);
      }, itemCount: product!.length),

    );
  }
}