import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test1/bottomnavbar.dart';
import 'package:test1/crm/login_crm.dart';
import 'package:test1/dribble.dart';
import 'package:test1/final/homescreen.dart';
import 'package:test1/hive.dart';
import 'package:test1/own/assignment/getinfo.dart';
import 'package:test1/own/assignment/posts.dart';
import 'package:test1/own/assignment2/show_data.dart';
import 'package:test1/userinterface/dribble.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping_box');
  await Hive.openBox('crud_operations');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePagge(),
    );
  }
}


 