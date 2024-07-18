import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
//{value1:adress1}

// Home Page
class HomePagge extends StatefulWidget {
  const HomePagge({Key? key}) : super(key: key);

  @override
  State<HomePagge> createState() => _HomePaggeState();
}

class _HomePaggeState extends State<HomePagge> {
  List<Map<String, dynamic>> _items = [];

  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems(); // Load data when app starts
  }

  // Get all items from the database
  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {"key": key, "name": value["name"], "quantity": value['quantity'],"email":value["email"],"location":value["location"],"address":value["address"]};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

 
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems(); // update the UI
  }

  
  Map<String, dynamic> _readItem(int key) {
    final item = _shoppingBox.get(key);
    return item;
  }


  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _shoppingBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

 
  Future<void> _deleteItem(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();
final TextEditingController _locationcontroller=TextEditingController();
  final TextEditingController _addresscontroller=TextEditingController();
  void _showForm(BuildContext ctx, int? itemKey) async {
  

    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
      _emailcontroller.text=existingItem['email'];
      _locationcontroller.text=existingItem['location'];
      _addresscontroller.text=existingItem['address'];

    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Quantity'),
                  ),
                   const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailcontroller,
                  
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 10),
                   TextField(
                    controller: _locationcontroller,
                  
                    decoration: const InputDecoration(hintText: 'Location'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _addresscontroller,
                    decoration: const InputDecoration(hintText: 'Proper Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new item
                      if (itemKey == null) {
                        _createItem({
                          "name": _nameController.text,
                          "quantity": _quantityController.text,
                          "email":_emailcontroller.text,
                          "location":_locationcontroller.text,
                          "address":_addresscontroller.text,
                        });
                      }

                      // update an existing item
                      if (itemKey != null) {
                        _updateItem(itemKey, {
                          'name': _nameController.text.trim(),
                          'quantity': _quantityController.text.trim(),
                          'email':_emailcontroller.text.trim(),
                          "location":_locationcontroller.text.trim(),
                          "address":_addresscontroller.text.trim(),
                        });
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _quantityController.text = '';
                       _emailcontroller.text='';
                       _locationcontroller.text='';

                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    child: Text(itemKey == null ? 'Create New' : 'Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLUTTER  '),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final currentItem = _items[index];
                return Card(
                  color: Colors.orange.shade100,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                      title: Text(currentItem['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentItem['quantity'].toString()),
                          Text(currentItem['email'].toString()),
                          Text(currentItem['location'].toString()),
                          Text(currentItem['address'].toString()),
                        ],
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit button
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _showForm(context, currentItem['key'])),
                          // Delete button
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteItem(currentItem['key']),
                          ),
                        ],
                      )),
                );
              }),
      // Add new item button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}