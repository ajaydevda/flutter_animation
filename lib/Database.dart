import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider();
  static Database _database;


  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path+"TestDB.db";


    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE searchHistory ("
          "id INTEGER PRIMARY KEY,"
          "stockCode TEXT"
          ")");
    });
  }


  Future<Database> get database async {
    if (_database != null)
      return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }


  Future<int> getHistory() async {
    var dbClient = await database;

    List<Map> list =
        await dbClient.rawQuery('SELECT * FROM searchHistory');
        print(list.elementAt(0)['id']);
        return 0;

  }

  Future<int> addhistory() async {
    var dbClient = await database;

    return await dbClient.rawInsert(
        "INSERT Into searchHistory (id,stockCode)"
            " VALUES (5,'cccc')");


  }




}


