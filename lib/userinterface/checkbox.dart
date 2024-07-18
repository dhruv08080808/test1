import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/userinterface/stless.dart';

class checkbox extends StatefulWidget {
  const checkbox({super.key});

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {

 final  _isloading=true;
  final dio=Dio();
  List?pro;
  bool? age;
  bool?agee;
 var jsonlist;
 @override
  void initState() {
getdata();
    super.initState();
  }
  
 getdata()async{
  
   
final resp= await dio.get('https://fakestoreapi.com/products');
print("first: ${resp.data}");
setState(() {
  pro=resp.data;
});
}


  String?gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text('CHECKBOX',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black))),
        body: SingleChildScrollView(
          child: Column(children: [
          ListTile(
            leading:  Radio(
            
            value:"male" , groupValue: gender, onChanged: (v){
            setState(() {
              gender=v;
              
            });
           }),
            title: Text('MALE'),
          
          ),
          ListTile(
            leading: Radio(value: 'female', groupValue: gender, onChanged: (val){
              setState(() {
                 gender=val;
              });
             
            }),
                title: Text('FEMALE'),
          ),     
              SizedBox(height: 10),
              Row(
                children: [ Checkbox(
          tristate: true,
          value: age, onChanged: (bool?  val){
          setState(() {
            age=val;
          });
                
                }),
                Text('YES'),
                ],
             
              ),
              Row(
                children: [
          Checkbox(
            visualDensity: VisualDensity.standard,
            tristate: true,
            value:agee, onChanged: (bool? value){
            setState(() {
              agee=value;
            });
          }),
          Text('NO')
                ],
              ),
              _isloading==false?CircularProgressIndicator():
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,i){
          return ListTile(
            leading: Image.network(pro![i]['image']),
            title: Text(pro![i]['title']),
          );
                }, separatorBuilder: (context,i){
                return SizedBox(width: 10);
              }, itemCount: pro!.length),
              stless(txt: 'hello world', fntsize: 10, border: 20, clr: Colors.red)
          ]),
        ),

    );
  }
}