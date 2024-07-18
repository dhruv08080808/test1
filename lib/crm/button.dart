import 'package:flutter/material.dart';

class button extends StatelessWidget {

  final Color containercolor;
  final Color Borderclr;
  final double height;
  final double width;
  final Widget content;
  const button({super.key,  required this.containercolor, required this.Borderclr, required this.height, required this.width, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: height,
    width: width,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Borderclr),
        color:containercolor
      ),
      child: content
      );
     
    
  }
}
//Center(child: Text(txt,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:txtcolor ),))