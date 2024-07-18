import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Postdetail extends StatefulWidget {
  final int passdetails;
  const Postdetail({super.key, required this.passdetails});

  @override
  State<Postdetail> createState() => _PostdetailState();
}

class _PostdetailState extends State<Postdetail> {
  final dio = Dio();
  List? postdetailss;
  getpostdetailsapi() async {
    final res = await dio.get('https://jsonplaceholder.typicode.com/users/${widget.passdetails}');
    print('${res.data}');
    setState(() {
      postdetailss = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, i) {
              return ListTile(
                subtitle: Text(postdetailss![i]['body']),
              );
            },
            separatorBuilder: (context, i) {
              return SizedBox(height: 20);
            },
            itemCount: postdetailss!.length));
  }
}
