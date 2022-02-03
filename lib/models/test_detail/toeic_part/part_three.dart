import 'dart:convert';

import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/group_question.dart';
import 'package:hive/hive.dart';

part 'part_three.g.dart';

@HiveType(typeId: 3)
class PartThree {
  @HiveField(0)
  String audioPath;
  @HiveField(1)
  String? picturePath;
  @HiveField(2)
  String transcript;
  @HiveField(3)
  List<GroupQuestion> groupQuestion;
  PartThree({
    required this.audioPath,
    this.picturePath,
    required this.transcript,
    required this.groupQuestion,
  });

  Map<String, dynamic> toMap() {
    return {
      'audioPath': audioPath,
      'picturePath': picturePath,
      'transcript': transcript,
      'groupQuestion': groupQuestion.map((x) => x.toMap()).toList(),
    };
  }

  factory PartThree.fromMap(Map<String, dynamic> map) {
    return PartThree(
      audioPath: map['audioPath'] ?? '',
      picturePath: map['picturePath'],
      transcript: map['transcript'] ?? '',
      groupQuestion: List<GroupQuestion>.from(
          map['groupQuestion']?.map((x) => GroupQuestion.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PartThree.fromJson(String source) =>
      PartThree.fromMap(json.decode(source));
}
