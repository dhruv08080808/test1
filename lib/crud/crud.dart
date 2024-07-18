import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class HomePagee extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  late Database _database;
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'items_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)",
        );
      },
      version: 1,
    );
    _refreshItems();
  }

  Future<void> _refreshItems() async {
    final List<Map<String, dynamic>> items = await _database.query('items');
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem(String name) async {
    await _database.insert('items', {'name': name});
    _refreshItems();
  }

  Future<void> _updateItem(int id, String name) async {
    await _database.update('items', {'name': name}, where: 'id = ?', whereArgs: [id]);
    _refreshItems();
  }

  Future<void> _deleteItem(int id) async {
    await _database.delete('items', where: 'id = ?', whereArgs: [id]);
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Demo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter item name',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addItem(_textController.text);
              _textController.clear();
            },
            child: Text('Add Item'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item['name']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Edit Item'),
                              content: TextField(
                                controller: TextEditingController(text: item['name']),
                                onChanged: (text) {
                                  item['name'] = text;
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _updateItem(item['id'], item['name']);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Delete Item'),
                              content: Text('Are you sure you want to delete this item?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deleteItem(item['id']);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
