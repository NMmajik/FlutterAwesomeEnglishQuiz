import 'dart:convert';

import 'package:hive/hive.dart';

part 'test_info.g.dart';

@HiveType(typeId: 12)
class TestInfo {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String size;
  @HiveField(2)
  final int questionNumber;
  @HiveField(3)
  final int ver;
  @HiveField(4)
  final String resourceUrl;
  @HiveField(5)
  final int score; // only visiable in DB
  @HiveField(6)
  bool downloaded; // only visiable in DB
  @HiveField(7)
  String? boxId; // only visiable in DB
  TestInfo({
    required this.title,
    required this.size,
    required this.questionNumber,
    required this.ver,
    required this.resourceUrl,
    this.score = -1,
    this.downloaded = false,
    this.boxId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'size': size,
      'question_number': questionNumber,
      'ver': ver,
      'resource_url': resourceUrl,
    };
  }

  factory TestInfo.fromMap(Map<String, dynamic> map) {
    return TestInfo(
      title: map['title'] ?? '',
      size: map['size'] ?? '',
      questionNumber: map['question_number']?.toInt() ?? 0,
      ver: map['ver']?.toInt() ?? 0,
      resourceUrl: map['resource_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TestInfo.fromJson(String source) =>
      TestInfo.fromMap(json.decode(source));
}
