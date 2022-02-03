import 'dart:convert';

import 'package:hive/hive.dart';

part 'part_one.g.dart';

@HiveType(typeId: 1)
class PartOne {
  @HiveField(0)
  int number;
  @HiveField(1)
  String audioPath;
  @HiveField(2)
  String picturePath;
  @HiveField(3)
  int correctAns;
  @HiveField(4)
  String transcriptA;
  @HiveField(5)
  String transcriptB;
  @HiveField(6)
  String transcriptC;
  @HiveField(7)
  String transcriptD;
  PartOne({
    required this.number,
    required this.audioPath,
    required this.picturePath,
    required this.correctAns,
    required this.transcriptA,
    required this.transcriptB,
    required this.transcriptC,
    required this.transcriptD,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'audioPath': audioPath,
      'picturePath': picturePath,
      'correctAns': correctAns,
      'transcriptA': transcriptA,
      'transcriptB': transcriptB,
      'transcriptC': transcriptC,
      'transcriptD': transcriptD,
    };
  }

  factory PartOne.fromMap(Map<String, dynamic> map) {
    return PartOne(
      number: map['number']?.toInt() ?? 0,
      audioPath: map['audioPath'] ?? '',
      picturePath: map['picturePath'] ?? '',
      correctAns: map['correctAns']?.toInt() ?? 0,
      transcriptA: map['transcriptA'] ?? '',
      transcriptB: map['transcriptB'] ?? '',
      transcriptC: map['transcriptC'] ?? '',
      transcriptD: map['transcriptD'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PartOne.fromJson(String source) =>
      PartOne.fromMap(json.decode(source));
}
