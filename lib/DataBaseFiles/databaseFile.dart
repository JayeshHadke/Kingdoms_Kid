import 'package:kingdoms_kids/DataBaseFiles/templets_DB.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE_NAME = 'initialTable';
const String DB_NAME = 'initialDB.db';

class DB {
  final database = openDatabase(
    join(getDatabasesPath().toString(), DB_NAME),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $TABLE_NAME (ID INTEGER PRIMARY KEY, logged INTEGER)');
    },
    version: 1,
  );
  Future<void> insertData(SQL sql) async {
    final db = await database;
    await db.insert(TABLE_NAME, sql.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<SQL>> getData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(
      maps.length,
      (index) {
        return SQL(logged: maps[index]['logged']);
      },
    );
  }

  check() async {
    Future<List<SQL>> _futureOfList = getData();
    List<SQL> list = await _futureOfList;
  }
}
