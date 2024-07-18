// import 'package:flutter/material.dart';
// import 'package:test1/crud/sql_helper.dart';

// class ui extends StatefulWidget {
//   const ui({super.key});

//   @override
//   State<ui> createState() => _uiState();
// }

// class _uiState extends State<ui> {

//   List<Map<String,dynamic>>_fulldata=[];
//   bool _isloading=true;
//   void _refresh()async{
//     final   data= await SQLHelper.getitems();
//     setState(() {
//       _fulldata=data;
//       _isloading=false;
      
//     });
//   }
// @override
//   void initState() {
//     super.initState();
//     _refresh();
//   }

//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
// void _show(int? id)async{
//   if(id!=null){
//     final existing=_fulldata.firstWhere((element) => element['id']==id);
//     _titleController.text=existing['title'];
//     _descriptionController.text=existing['description'];
//   }
//  showModalBottomSheet(
//         context: context,
//         elevation: 5,
//         isScrollControlled: true,
//         builder: (_) => Container(
//               padding: EdgeInsets.only(
//                 top: 15,
//                 left: 15,
//                 right: 15,
//                 // this will prevent the soft keyboard from covering the text fields
//                 bottom: MediaQuery.of(context).viewInsets.bottom + 120,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   TextField(
//                     controller: _titleController,
//                     decoration: const InputDecoration(hintText: 'Title'),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _descriptionController,
//                     decoration: const InputDecoration(hintText: 'Description'),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // Save new journal
//                       if (id == null) {
//                         await _additem();
//                       }

//                       if (id != null) {
//                         await _updateitem(id);
//                       }

//                       // Clear the text fields
//                       _titleController.text = '';
//                       _descriptionController.text = '';

//                       // Close the bottom sheet
//                       if (!mounted) return;
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(id == null ? 'Create New' : 'Update'),
//                   )
//                 ],
//               ),
//             ));
// }



//   Future<void> _additem()async{
//     await SQLHelper.createitem(_titleController.text, _descriptionController.text);
//     _refresh();

//   }

//   Future<void>_updateitem(int id)async{
// await SQLHelper.updateItem(id, _titleController.text, _descriptionController.text);
// _refresh();
//   }

//   Future<void>deleteitem(int id)async{
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('sucess')));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Crud operation screen')),
//       body:  _isloading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: _fulldata.length,
//               itemBuilder: (context, index) => Card(
//                 color: Colors.orange[200],
//                 margin: const EdgeInsets.all(15),
//                 child: ListTile(
//                     title: Text(_fulldata[index]['title']),
//                     subtitle: Text(_fulldata[index]['description']),
//                     trailing: SizedBox(
//                       width: 100,
//                       child: Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit),
//                             onPressed: () => _show(_fulldata[index]['id']),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () =>
//                                 deleteitem(_fulldata[index]['id']),
//                           ),
//                         ],
//                       ),
//                     )),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _show(null),
//       ),
//     );
//   }
// }