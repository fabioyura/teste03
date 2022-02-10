import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseFavoritos {
  static const _databaseName = "StarWarsDados.db";
  static const _databaseVersion = 1;
  static const table = 'Favoritos';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnType = 'type';

  DatabaseFavoritos._privateConstructor();
  static final DatabaseFavoritos instance =
      DatabaseFavoritos._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnType TEXT NOT NULL
          )
          ''');
  }

  Future<int> inserirFavorito(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<int> deletarFavorito(String name) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnName = ?', whereArgs: [name]);
  }

  Future<List<Map<String, dynamic>>> getFavoritos() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
}
