import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/Container.dart'; // Assuming Containerr is defined in Container.dart

class Dribblee extends StatefulWidget {
  const Dribblee({Key? key}) : super(key: key);

  @override
  State<Dribblee> createState() => _DribbleeState();
}

class _DribbleeState extends State<Dribblee> {
  List<String> roomimg = [
    'https://images.rosewoodhotels.com/is/image/rwhg/hi-hgv-26330925-rhgmodelbedroom-1',
    'https://images.rosewoodhotels.com/is/image/rwhg/hi-hgv-26330925-rhgmodelbedroom-1',
    'https://images.rosewoodhotels.com/is/image/rwhg/hi-hgv-26330925-rhgmodelbedroom-1',
    'https://images.rosewoodhotels.com/is/image/rwhg/hi-hgv-26330925-rhgmodelbedroom-1'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.line_style, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 10),
            Text('12 SAT, AUGUST',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text('Welcome Back,',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Eythan\'s Home',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 15),
                  )
                ])
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 125,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image.network(roomimg[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: roomimg.length,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorite Accessories',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Text('See All',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue)),
              ],
            ),
            SizedBox(height: 10),
//             Expanded(
          
//               child: GridView.count(
//                 childAspectRatio: 1,
//                 crossAxisCount: 4,
//                  mainAxisSpacing: 12,
//                  crossAxisSpacing: 12,
//                  //childAspectRatio:  0.2,
                 
//                 //  MediaQuery.of(context).size.width /
//                 //       (MediaQuery.of(context).size.height / 1),
//                 shrinkWrap: true,

//                 children: [
//                   // Card(
//                   //   color: Colors.white,
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.all(8.0),
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //        Icon(Icons.star,size: 15,),
//                   //                   SizedBox(height: 8),
//                   //                   Text('Living Room',style: TextStyle(fontSize: 10)),
//                   //                   Text('Air Conditioner')
//                   //     ],),
//                   //   ),
//                   // )
// Expanded(
//   child: Container(
//     height: 80,
//     width: 40,
//     color: Colors.red,
//     child: Column(
//       children: [
//          Icon(Icons.star),
//                 SizedBox(height: 8),
//                 Text('Air Conditioner'),
//                 SizedBox(height: 8),
//                 Text('washing machine'),
//       ],
//     )
//   ),
// ),
// Container(
//   height: 40,
//   width: 40,
//   color: Colors.red,
//   child: Text('xyz'),
// ),
// Container(
//   height: 40,
//   width: 40,
//   color: Colors.red,
//   child: Text('xyz'),
// ),Container(
//   height: 40,
//   width: 40,
//   color: Colors.red,
//   child: Text('xyz'),
// ),

//                 ],
//               ),
//             )

  Expanded(
    flex: 2,
    child: Row(children: [
      Container(
        height: 100,
        width: 60,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.star),
            SizedBox(height: 10),
            Text('Living room',style: TextStyle(fontSize: 10)),
             Text('Air Conditioner',style: TextStyle(fontSize: 8)),
             Text('on')
          ],),
        ),
      ),
      Container(
        height: 100,
        width: 60,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.star),
            SizedBox(height: 10),
            Text('Living room',style: TextStyle(fontSize: 10)),
             Text('Air Conditioner',style: TextStyle(fontSize: 8)),
             Text('on')
          ],),
        ),
      ),
      Container(
        height: 100,
        width: 60,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.star),
            SizedBox(height: 10),
            Text('Living room',style: TextStyle(fontSize: 10)),
             Text('Air Conditioner',style: TextStyle(fontSize: 8)),
             Text('on')
          ],),
        ),
      ),
      Container(
        height: 100,
        width: 80,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.star),
            SizedBox(height: 10),
            Text('Living room',style: TextStyle(fontSize: 10)),
             Text('Air Conditioner',style: TextStyle(fontSize: 8)),
             Text('on')
          ],),
        ),
      )
    //ontainerr(clr: Colors.white, txt: 'AIR CONDITIONER ', txtt: 'WASHING MACHINE')
     ],),
  )
          ],
        ),
      ),
    );
  }
}

// Assuming Containerr widget is defined in Container.dart
