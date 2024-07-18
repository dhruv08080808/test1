import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(Icons.access_alarm,color: Colors.white,),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(Icons.notification_add,color: Colors.white,),
        )],
        title: Text('WELCOME BACK',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 66, 103, 165),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight:Radius.circular(40) ),
            color: const Color.fromARGB(255, 66, 103, 165),
          ),
          height: 120,
          width: double.infinity,
          child: Column(children: [
             Text('Total Balance',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500)
             ),
             Row(
              children: [
                // Text('$748')
              ],
             )
          ],),
          ),
          SizedBox(height: 10),
         
      ],),
    );
  }
}