import 'package:path_provider/path_provider.dart';
import 'package:sqf/flu_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; 
import 'dart:io' as io;

class Helper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationCacheDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, age INTEGER NOT NULL, description TEXT NOT NULL, email TEXT)"
    );
  }

  Future<DataModel> insert(DataModel dbmodel) async {
    var dbClient = await db;
    await dbClient!.insert('notes', dbmodel.toMap());
    return dbmodel;
  }

  Future<List<DataModel>> getNOteList() async{
    var dbClient = await db;
    final List<Map<String, Object?>> querryResult = await dbClient!.query("notes");
    return querryResult.map((e) => DataModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
      'notes',
      where: 'id=?',
      whereArgs: [id]
    );
  }
}
