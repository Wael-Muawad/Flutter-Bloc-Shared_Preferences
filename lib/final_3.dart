import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:third/final_2.dart';

class DBHelper {
  static DBHelper _dbHelper;
  Database database;
  DBHelper._getInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._getInstance();
    }
    return _dbHelper;
  }

  initioalaizedataBace() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> db = openDatabase(
        join(await getDatabasesPath(), 'Cars.db'), onCreate: (db, version) {
      db.execute(
          'CREATE TABLE cources(id  INTEGER PRIMARY KEY,model TEXT,color TEXT,mark INTEGER)');
      //one table
    }, version: 1);

    database = await db;
  }

  void insertDate(Course c) {
    if (database == null) initioalaizedataBace();
    database.insert('cources', c.objectToMap());
  }



  Future<List<Map<String, dynamic>>> getAllDatta() {
    if (database == null) initioalaizedataBace();

    return database.query('cources');
  }





}