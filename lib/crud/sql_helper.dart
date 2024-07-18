// import 'package:sqflite/sqflite.dart' as sql;

// class SQLHelper {
//   static Future<void>createtables(sql.Database database)async{
//     await database.execute("""CREATE TABLE items(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         title TEXT,
//         description TEXT,
//         createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//       )
//       """);

//   }

//   static Future<sql.Database>db()async{
//     return sql.openDatabase(
//       'xyz.db',
//       version: 1,
//       onCreate: (sql.Database database,int version)async{
//         await createtables(database);
//       }

//     );
//   }


// //insert  
//   static Future<int> createitem(String title,String description)async{
//     final db=await SQLHelper.db();
//     final data={title:'title',description:'description'};
//     final id= await db.insert('items', data ,
//     conflictAlgorithm: sql.ConflictAlgorithm.replace);//prevent from duplicate entry
//     return id;
//   }

//   //read
//   static Future<List<Map<String,dynamic>>>getitems   ()async{
//     final db=await SQLHelper.db();
//     return db.query('items',orderBy: 'id');//query get an item
//   }

//   static Future<List<Map<String, dynamic>>> getItem(int id) async {
//     final db = await SQLHelper.db();
//     return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
//   }

// //update


// static Future<int> updateItem(
//       int id, String title, String? descrption) async {
//     final db = await SQLHelper.db();

//     final data = {
//       'title': title,
//       'description': descrption,
//       'createdAt': DateTime.now().toString()
//     };

//     final result =
//         await db.update('items', data, where: "id = ?", whereArgs: [id]);
//     return result;
//   }

//    static Future<void> deleteItem(int id) async {
//     final db = await SQLHelper.db();
//     try {
//       await db.delete("items" , where: "id = ?", whereArgs: [id]);
//     } catch (err) { 
//      print("$err");
//     }
//   }
// }