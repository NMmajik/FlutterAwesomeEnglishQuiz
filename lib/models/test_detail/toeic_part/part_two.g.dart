// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_two.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartTwoAdapter extends TypeAdapter<PartTwo> {
  @override
  final int typeId = 2;

  @override
  PartTwo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartTwo(
      number: fields[0] as int,
      audioPath: fields[1] as String,
      transcriptQuestion: fields[2] as String,
      correctAns: fields[3] as int,
      transcriptA: fields[4] as String,
      transcriptB: fields[5] as String,
      transcriptC: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PartTwo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.audioPath)
      ..writeByte(2)
      ..write(obj.transcriptQuestion)
      ..writeByte(3)
      ..write(obj.correctAns)
      ..writeByte(4)
      ..write(obj.transcriptA)
      ..writeByte(5)
      ..write(obj.transcriptB)
      ..writeByte(6)
      ..write(obj.transcriptC);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartTwoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
