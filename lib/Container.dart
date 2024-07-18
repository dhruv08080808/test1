

import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  final Color clr;
  final String txt;
  final String txtt;

  const Containerr({
    super.key,
    required this.clr,
    required this.txt,
    required this.txtt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), color: clr),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.star),
              SizedBox(height: 8),
              Text(txt),
              SizedBox(height: 8),
              Text(txtt),
            ],
          ),
        ),
      ),
    );
  }
}
