import 'dart:convert';

import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_four.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_one.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_three.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_two.dart';
import 'package:hive/hive.dart';

part 'toeic_test.g.dart';

@HiveType(typeId: 0)
class ToeicTest {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String des;
  @HiveField(2)
  final int ver;
  @HiveField(3)
  final List<PartOne> partOne;
  @HiveField(4)
  final List<PartTwo> partTwo;
  @HiveField(5)
  final List<PartThree> partThree;
  @HiveField(6)
  final List<PartFour> partFour;
  @HiveField(10)
  final int totalCorrectAnsPartOne;
  @HiveField(11)
  final int totalCorrectAnsPartTwo;
  @HiveField(12)
  final int totalCorrectAnsPartThree;
  @HiveField(13)
  final int totalCorrectAnsPartFour;
  ToeicTest({
    this.totalCorrectAnsPartOne = 0,
    this.totalCorrectAnsPartTwo = 0,
    this.totalCorrectAnsPartThree = 0,
    this.totalCorrectAnsPartFour = 0,
    required this.title,
    required this.des,
    required this.ver,
    required this.partOne,
    required this.partTwo,
    required this.partThree,
    required this.partFour,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'des': des,
      'ver': ver,
      'partOne': partOne.map((x) => x.toMap()).toList(),
      'partTwo': partTwo.map((x) => x.toMap()).toList(),
      'partThree': partThree.map((x) => x.toMap()).toList(),
      'partFour': partFour.map((x) => x.toMap()).toList(),
    };
  }

  factory ToeicTest.fromMap(Map<String, dynamic> map) {
    return ToeicTest(
      title: map['title'] ?? '',
      des: map['des'] ?? '',
      ver: map['ver']?.toInt() ?? 0,
      partOne:
          List<PartOne>.from(map['partOne']?.map((x) => PartOne.fromMap(x))),
      partTwo:
          List<PartTwo>.from(map['partTwo']?.map((x) => PartTwo.fromMap(x))),
      partThree: List<PartThree>.from(
          map['partThree']?.map((x) => PartThree.fromMap(x))),
      partFour:
          List<PartFour>.from(map['partFour']?.map((x) => PartFour.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ToeicTest.fromJson(String source) =>
      ToeicTest.fromMap(json.decode(source));
}
