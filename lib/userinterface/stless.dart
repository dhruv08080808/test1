import 'package:flutter/material.dart';

class stless extends StatelessWidget {
  final String txt;
  final double fntsize;
  final double border;
  final Color clr;
  const stless({super.key, required this.txt, required this.fntsize, required this.border, required this.clr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(border),
       color: clr
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(txt,style: TextStyle(fontSize:fntsize)),
          
          Text(txt)
        ],),
      ),

    );
  }
}