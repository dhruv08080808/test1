import 'package:flutter/material.dart';
import 'package:test1/own/assignment/getapi.dart';
import 'package:test1/own/authormodel.dart';

class getinfo extends StatefulWidget {
  const getinfo({super.key});

  @override
  State<getinfo> createState() => _getinfoState();
}

class _getinfoState extends State<getinfo> {


  @override
  void initState() {
    // TODO: implement initState
    getallpets();
    super.initState();
  }
  bool isLoading = false;
  Author?event;

   getallpets() {
    isLoading = true;
    var resp = getuserapi();
    resp.then((value) {
      if(value['status'] == true) {
        setState(() {
          event = Author.fromJson(value);
          // for (var v in event!.data! ) {
          //   if (v.type == "all") {
          //     event2.add(v);
          //   }
          // }
          isLoading = false;
        });
      } else{
        isLoading = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          centerTitle: true,
          title: Text('ASSIGNMENT',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber))),
      body: SingleChildScrollView(
        child: 
        
        // isLoading==true
        //     ? Center(child: CircularProgressIndicator())
        //     : 
            
            Column(
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             //Postdetail(passdetails: listofPost.id)
                                  
                      //             ));
                    },
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(
                              event!.name[i].toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            // subtitle: posts == null
                            //     ? CircularProgressIndicator()
                            //     : Text(posts![i]['body']),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return SizedBox(height: 10);
                        },
                        itemCount:event!.name.length ),
                  )
                ],
              ),
      ),
    );
  }
}