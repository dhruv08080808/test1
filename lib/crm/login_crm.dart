import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/crm/button.dart';
import 'package:test1/crm/welcome.dart';

class Logincrm extends StatefulWidget {
  const Logincrm({super.key});

  @override
  State<Logincrm> createState() => _LogincrmState();
}

class _LogincrmState extends State<Logincrm> {
  Color finalcolor = Colors.white;
  Color finaltxtcolor = Colors.black;
  int? myindexx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(70)),
              child: Image.network(
                'https://th.bing.com/th/id/OIP.IuQGVq0yeuJb05cTZcSD7gHaDy?rs=1&pid=ImgDetMain',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 196, 188, 188),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 7,
                      offset: Offset(40, 60), // Shadow position
                    ),
                  ],
                  //color: Colors.red
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_box,
                                  color: Colors.purple.shade300),
                              SizedBox(width: 5),
                              Text('Tokomi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Text('1/5',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(200, 243, 159, 159)))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'The Best Online\nApplication to help your\nbussiness Needs',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  myindexx = 0;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => welcome()),
                                  );
                                });
                              },
                              child: button(
                                containercolor:
                                    myindexx == 0 ? Colors.blue : Colors.white,
                                Borderclr:
                                    myindexx == 0 ? Colors.white : Colors.black,
                                height: 30,
                                width: 120,
                                content: Center(
                                    child: Text(
                                  ' Login',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: myindexx == 0
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  myindexx = 1;
                                });
                              },
                              child: button(
                                containercolor:
                                    myindexx == 1 ? Colors.blue : Colors.white,
                                Borderclr:
                                    myindexx == 1 ? Colors.white : Colors.black,
                                height: 30,
                                width: 120,
                                content: Center(
                                    child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: myindexx == 1
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
           const  Row(children: <Widget>[
              Expanded(child: Divider()),
              Text("  or login with   "),
              Expanded(child: Divider()),
            ]),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: button(
                  containercolor: Colors.white,
                  Borderclr: Colors.black,
                  height: 50,
                  width: double.infinity,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Icon(Icons.login),
                        SizedBox(width: 15),
                        Center(child: Text('SIGN IN WITH GOOGLE'))
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: button(
                  containercolor: Colors.white,
                  Borderclr: Colors.black,
                  height: 50,
                  width: double.infinity,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Icon(Icons.login),
                        SizedBox(width: 15),
                        Center(child: Text('Contiue With Apple'))
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: button(
                  containercolor: Colors.white,
                  Borderclr: Colors.black,
                  height: 50,
                  width: double.infinity,
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Icon(Icons.login),
                        SizedBox(width: 15),
                        Center(child: Text('continue with facebook'))
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
