/*
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SqliteHelper {
  static String dbName = 'weather.db';

  static Future<Database>? _database;

  Future<Database> get db async{
    return _database!;
  }

  SqliteHelper._privateConstructor(){
    _database ??= _createDatabase();
  }
  static final SqliteHelper _instance = SqliteHelper._privateConstructor();

  factory SqliteHelper(){
    return _instance;
  }

  Future<Database> _createDatabase() async{
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute('CREATE TABLE ...');},);
  }
}*/
