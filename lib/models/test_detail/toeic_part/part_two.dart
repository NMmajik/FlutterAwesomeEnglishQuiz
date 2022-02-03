import 'dart:convert';

import 'package:hive/hive.dart';

part 'part_two.g.dart';

@HiveType(typeId: 2)
class PartTwo {
  @HiveField(0)
  int number;
  @HiveField(1)
  String audioPath;
  @HiveField(2)
  String transcriptQuestion;
  @HiveField(3)
  int correctAns;
  @HiveField(4)
  String transcriptA;
  @HiveField(5)
  String transcriptB;
  @HiveField(6)
  String transcriptC;
  PartTwo({
    required this.number,
    required this.audioPath,
    required this.transcriptQuestion,
    required this.correctAns,
    required this.transcriptA,
    required this.transcriptB,
    required this.transcriptC,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'audioPath': audioPath,
      'transcriptQuestion': transcriptQuestion,
      'correctAns': correctAns,
      'transcriptA': transcriptA,
      'transcriptB': transcriptB,
      'transcriptC': transcriptC,
    };
  }

  factory PartTwo.fromMap(Map<String, dynamic> map) {
    return PartTwo(
      number: map['number']?.toInt() ?? 0,
      audioPath: map['audioPath'] ?? '',
      transcriptQuestion: map['transcriptQuestion'] ?? '',
      correctAns: map['correctAns']?.toInt() ?? 0,
      transcriptA: map['transcriptA'] ?? '',
      transcriptB: map['transcriptB'] ?? '',
      transcriptC: map['transcriptC'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PartTwo.fromJson(String source) =>
      PartTwo.fromMap(json.decode(source));
}
