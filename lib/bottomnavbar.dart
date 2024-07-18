import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/dribble.dart';
import 'package:test1/final/homescreen.dart';
import 'package:test1/own/hivee.dart';

class botoomnavbar extends StatefulWidget {
  const botoomnavbar({super.key});

  @override
  State<botoomnavbar> createState() => _botoomnavbarState();
}

class _botoomnavbarState extends State<botoomnavbar> {
  int indexx=0;
  PageController _pageController=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.fromLTRB(32, 12, 32, 16),
          child: 
        Column(
          children: [
            Row(children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  indexx=0;
                  indexx==_pageController;
                  _pageController.jumpToPage(indexx);
                });
              },
              child: Column(children: [
                Icon(Icons.home,color: indexx==0?Colors.black:Colors.red),
                SizedBox(height: 20),
                Text('HOME',style: TextStyle(color: indexx==0?Colors.black:Colors.red),)
              ]),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                setState(() {
                  indexx=1;
                  indexx==_pageController;
                  _pageController.jumpToPage(indexx);
                });
              },
              child: Column(children: [
              Icon(Icons.alarm,color: indexx==1?Colors.black:Colors.red),
              SizedBox(height: 20),
              Text('SELL',style: TextStyle(color: indexx==1?Colors.black:Colors.red),)
              ]),
              
            ),
               Spacer(),
            GestureDetector(
              onTap: (){
                indexx=2;
                indexx==_pageController;
                _pageController.jumpToPage(indexx);
        
              },
              child: Column(children: [
                Icon(Icons.ac_unit_rounded,color: indexx==2?Colors.black:Colors.red),
                  SizedBox(height: 20),
                Text('PURCHASE',style: TextStyle(color: indexx==2?Colors.black:Colors.red),)
              ],),
            ),
               Spacer(),
            GestureDetector(
              onTap: (){
                indexx=3;
                indexx==_pageController;
                _pageController.jumpToPage(indexx);
        
              },
              child: Column(children: [
                Icon(Icons.ac_unit_rounded,color: indexx==3?Colors.black:Colors.red),
                  SizedBox(height: 20),
                Text('SETTING',style: TextStyle(color: indexx==3?Colors.black:Colors.red),)
              ],),
            )
            ]),
          ],
        )),
      ),
body: PageView(controller: _pageController,
children: [hivee(),Dribblee(),HomeScreenn(),Dribblee()],
onPageChanged: (v){
  setState(() {
    indexx=v;
  });
},
),
    );
  }
}