import 'dart:convert';

import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/group_question.dart';
import 'package:hive/hive.dart';

part 'part_four.g.dart';

@HiveType(typeId: 4)
class PartFour {
  @HiveField(0)
  String audioPath;
  @HiveField(1)
  String? picturePath;
  @HiveField(2)
  String transcript;
  @HiveField(3)
  List<GroupQuestion> groupQuestion;
  PartFour({
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

  factory PartFour.fromMap(Map<String, dynamic> map) {
    return PartFour(
      audioPath: map['audioPath'] ?? '',
      picturePath: map['picturePath'],
      transcript: map['transcript'] ?? '',
      groupQuestion: List<GroupQuestion>.from(
          map['groupQuestion']?.map((x) => GroupQuestion.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PartFour.fromJson(String source) =>
      PartFour.fromMap(json.decode(source));
}
