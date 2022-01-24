import 'dart:convert';

import 'package:flutter_toeic_quiz/database/local/utils/book_sqlite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BooksSqliteApi {
  static final BooksSqliteApi instance = BooksSqliteApi._init();
  static Database? _database = null;

  BooksSqliteApi._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('book_items_list.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('tandq dbpath: $path');
    return await openDatabase(path, version: 1, onCreate: _createBD);
  }

  Future _createBD(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
CREATE TABLE $tableDbToeicBookItem (
  ${DbBookItemField.id} $idType,
  ${DbBookItemField.title} $textType,
  ${DbBookItemField.des} $textType,
  ${DbBookItemField.author} $textType,
  ${DbBookItemField.cover_url} $textType,
  ${DbBookItemField.test_detail_raw} $textType
  )
''');
  }

//   Future _createBD(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY';
//     final textType = 'TEXT NOT NULL';
//     await db.execute('''
// CREATE TABLE $tableDbBookItem (
//   ${DbBookItemField.id} $idType,
//   ${DbBookItemField.title} $textType,
//   ${DbBookItemField.des} $textType,
//   ${DbBookItemField.author} $textType,
//   ${DbBookItemField.resource_url} $textType
//   )
// ''');
//   }

  Future<BookSqlite> create(BookSqlite dbBookItem) async {
    final db = await instance.database;
    final id = await db.insert(tableDbToeicBookItem, dbBookItem.toJson());
    return dbBookItem.copy(id: id);
  }

  Future<List<BookSqlite>> readAllDbBookItem() async {
    final db = await instance.database;
    final orderBy = '${DbBookItemField.id}';
    final result = await db.query(tableDbToeicBookItem, orderBy: orderBy);
    return result.map((json) => BookSqlite.fromJson(json)).toList();
  }

  Future<BookSqlite?> readDbBookItem(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableDbToeicBookItem,
        columns: DbBookItemField.values,
        where: '${DbBookItemField.id} =  ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return BookSqlite.fromJson(maps.first);
    } else {
      //throw Exception('ID $id not found in database');
      return null;
    }
  }

  Future<int> update(BookSqlite dbBookItem) async {
    final db = await instance.database;
    return db.update(
      tableDbToeicBookItem,
      dbBookItem.toJson(),
      where: '${DbBookItemField.id} = ?',
      whereArgs: [DbBookItemField.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(
      tableDbToeicBookItem,
      where: '${id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
