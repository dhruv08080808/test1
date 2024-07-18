import 'package:flutter/material.dart';
import 'package:test1/userinterface/stless.dart';

class coderefactor extends StatefulWidget {
  const coderefactor({super.key});

  @override
  State<coderefactor> createState() => _coderefactorState();
}

class _coderefactorState extends State<coderefactor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:stless(txt: 'hello', fntsize: 10, border:22 , clr: Colors.greenAccent)
    );
  }
}