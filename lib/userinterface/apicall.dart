import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apicall extends StatefulWidget {
  const apicall({super.key});

  @override
  State<apicall> createState() => _apicallState();
}

class _apicallState extends State<apicall> {
  @override
  void initState() {
    // TODO: implement initState
    getapidata();
    super.initState();
  }
  final dio=Dio();
  List? dataaa;
  getapidata()async{
   final resp= await dio.get('https://fake-store-api.mock.beeceptor.com/api/products');
   print("${resp.data}");
    setState(() {
      dataaa = resp.data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title:Text('API DATA ')),
        body: ListView.separated(itemBuilder: (context,i){
          return ListTile(
            leading: Image.network(dataaa![i]['image']),
            title: Text(dataaa![i]['name']),
          );
        }, separatorBuilder: (context,i){
          return SizedBox(height: 10);
        }, itemCount: dataaa!.length)
    );
  }
}