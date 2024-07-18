import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class hivee extends StatefulWidget {
  const hivee({super.key});

  @override
  State<hivee> createState() => _hiveeState();
}

class _hiveeState extends State<hivee> {
  List<Map<String, dynamic>> _items = []; //ek list bani h just

  final _crudoperations = Hive.box(
      'crud_operations'); //box ko open krke ek variable m store kiya h bsss

  Future<void> _createitem(Map<String, dynamic> newitem) async {
    await _crudoperations.add(newitem);
    _refreshitems();
    print("ammount of data is ${_crudoperations.length}"); //kitne baar kiya
  }

  Future<void> _updateitem(int itemkey, Map<String, dynamic> item) async {
    await _crudoperations.put(itemkey, item);
    _refreshitems();
  }

  Future<void> _deleteItem(int Itemkey) async {
    await _crudoperations.delete(Itemkey);
    _refreshitems();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  void _refreshitems() {
    final data = _crudoperations.keys.map((key) {
      final item = _crudoperations.get(key); //keys get krna
      return {"key": key, "name": item["name"], "desc": item["desc"]};
    }).toList();
    setState(() {
      _items = data.reversed.toList(); //sort ke liye latest
      print(_items.length);
    });
  }

  @override
  void initState() {
    _refreshitems();
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showform(BuildContext ctx, int? Itemkey) async {
    if (Itemkey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == Itemkey);
      _nameController.text = existingItem['name'];
      _descriptionController.text = existingItem['desc'];
    }
    showModalBottomSheet(
        elevation: 4,
        isScrollControlled: true,
        context: ctx,
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
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (Itemkey == null) {
                          _createitem({
                            "name": _nameController.text,
                            "desc": _descriptionController.text
                          });
                        }

                        if (Itemkey != null) {
                          _updateitem(Itemkey, {
                            'name': _nameController.text.trim(),
                            'desc': _descriptionController.text.trim(),
                          });
                        }
                        _nameController.text = '';
                        _descriptionController.text = '';
                        Navigator.of(context).pop();
                      },
                      child: Text(Itemkey == null ? 'Create new' : 'update'))
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HIVE ')),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, i) {
            final currentItem = _items[i];
            return Card(
              elevation: 3,
              color: Colors.orange,
              child: ListTile(
                title: Text(currentItem['name']),
                subtitle: Text(currentItem['desc'].toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => _showform(context, currentItem['key']),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: () => _deleteItem(currentItem['key']),
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showform(context, null),
          child: const Icon(Icons.add)),
    );
  }
}
