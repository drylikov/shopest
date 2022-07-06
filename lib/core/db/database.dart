import 'package:shopest/core/db/database_shemas.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._internal();
  static final DBProvider db = DBProvider._internal();

  factory DBProvider() => db;
  Database? _database;

  Future<Database> get database async {
    // if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = await getDatabasesPath() + '/main.db';
    return await openDatabase(path,
        version: 1, onCreate: _createDB, onOpen: _openDB);
  }

  void _createDB(Database db, int version) async {
    db.setVersion(version);
  }

  void _openDB(Database db) {
    for (String schema in DataBaseShemas.shemas) {
      db.execute(schema);
    }
  }

  Future<List<Map<String, Object?>>> getTable(String table) async {
    Database db = await database;
    return await db.query(table);
  }

  Future<void> insert(String table, Map<String, Object?> values) async {
    Database db = await database;
    await db.insert(table, values);
  }

  Future<void> deleteTablesInside(String table) async {
    Database db = await database;
    await db.delete(table);
  }

  Future<List<Map<String, Object?>>> count(String table) async {
    Database db = await database;
    return await db.rawQuery('SELECT count(*) FROM $table');
  }

  void exec(String query) async {
    Database db = await database;
    db.execute(query);
  }
}
