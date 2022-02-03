import 'dart:convert';

import 'package:hive/hive.dart';

part 'group_question.g.dart';

@HiveType(typeId: 10)
class GroupQuestion {
  @HiveField(0)
  int number;
  @HiveField(1)
  int correctAns;
  @HiveField(2)
  String questionStr;
  @HiveField(3)
  String ansA;
  @HiveField(4)
  String ansB;
  @HiveField(5)
  String ansC;
  @HiveField(6)
  String ansD;
  GroupQuestion({
    required this.number,
    required this.correctAns,
    required this.questionStr,
    required this.ansA,
    required this.ansB,
    required this.ansC,
    required this.ansD,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'correctAns': correctAns,
      'questionStr': questionStr,
      'ansA': ansA,
      'ansB': ansB,
      'ansC': ansC,
      'ansD': ansD,
    };
  }

  factory GroupQuestion.fromMap(Map<String, dynamic> map) {
    return GroupQuestion(
      number: map['number']?.toInt() ?? 0,
      correctAns: map['correctAns']?.toInt() ?? 0,
      questionStr: map['questionStr'] ?? '',
      ansA: map['ansA'] ?? '',
      ansB: map['ansB'] ?? '',
      ansC: map['ansC'] ?? '',
      ansD: map['ansD'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupQuestion.fromJson(String source) =>
      GroupQuestion.fromMap(json.decode(source));
}
