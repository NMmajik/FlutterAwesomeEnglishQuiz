import 'dart:convert';

import 'package:flutter_toeic_quiz/database/local/utils/test_sqlite.dart';

final String tableDbToeicBookItem = 'dbtoeicbookitems';

class DbBookItemField {
  static final List<String> values = [
    id,
    title,
    des,
    author,
    cover_url,
    test_detail_raw
  ];
  static final String id = 'id';
  static final String title = 'title';
  static final String des = 'des';
  static final String author = 'author';
  static final String cover_url = 'cover_url';
  static final String price = 'price';
  static final String test_detail = 'test_detail';
  static final String test_detail_raw = 'test_detail_raw';
}

class BookSqlite {
  final int id;
  final String title;
  final String des;
  final String author;
  final String cover_url;
  final String test_detail_raw;
  final int? price;
  BookSqlite({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.cover_url,
    required this.test_detail_raw,
    this.price,
  });

  Map<String, Object?> toJson() => {
        DbBookItemField.id: id,
        DbBookItemField.title: title,
        DbBookItemField.des: des,
        DbBookItemField.author: author,
        DbBookItemField.cover_url: cover_url,
        DbBookItemField.test_detail_raw: test_detail_raw,
      };

  static BookSqlite fromJson(Map<String, Object?> json) => BookSqlite(
        id: json[DbBookItemField.id] as int,
        title: json[DbBookItemField.title] as String,
        des: json[DbBookItemField.des] as String,
        author: json[DbBookItemField.author] as String,
        cover_url: json[DbBookItemField.cover_url] as String,
        test_detail_raw: json[DbBookItemField.test_detail] == null
            ? json[DbBookItemField.test_detail_raw] as String
            : _parseToTestSqliteRaw(
                json[DbBookItemField.test_detail] as List<dynamic>),
        price: json[DbBookItemField.price] == null
            ? null
            : json[DbBookItemField.price] as int,
      );

  BookSqlite copy({
    int? id,
    String? title,
    String? des,
    String? author,
    String? cover_url,
  }) =>
      BookSqlite(
        id: id ?? this.id,
        title: title ?? this.title,
        des: des ?? this.des,
        author: author ?? this.author,
        cover_url: cover_url ?? this.cover_url,
        price: this.price,
        test_detail_raw: this.test_detail_raw,
      );

  static String _parseToTestSqliteRaw(List<dynamic> jsonList) {
    List<TestSqlite> listTestSqlite = [];
    for (dynamic json in jsonList) {
      listTestSqlite.add(TestSqlite.fromJson(json));
    }
    String json = jsonEncode(listTestSqlite);
    return json;
  }
}
