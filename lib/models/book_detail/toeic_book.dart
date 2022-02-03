import 'dart:convert';

import 'package:flutter_toeic_quiz/models/book_detail/test_info.dart';
import 'package:hive/hive.dart';

part 'toeic_book.g.dart';

@HiveType(typeId: 11)
class ToeicBook {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String des;
  @HiveField(3)
  String author;
  @HiveField(4)
  String coverUrl;
  @HiveField(5)
  int price;
  @HiveField(6)
  List<TestInfo> testInfos;
  ToeicBook({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.testInfos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'des': des,
      'author': author,
      'cover_url': coverUrl,
      'price': price,
      'test_detail': testInfos.map((x) => x.toMap()).toList(),
    };
  }

  factory ToeicBook.fromMap(Map<String, dynamic> map) {
    return ToeicBook(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      des: map['des'] ?? '',
      author: map['author'] ?? '',
      coverUrl: map['cover_url'] ?? '',
      price: map['price']?.toInt() ?? 0,
      testInfos: List<TestInfo>.from(
          map['test_detail']?.map((x) => TestInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ToeicBook.fromJson(String source) =>
      ToeicBook.fromMap(json.decode(source));
}
