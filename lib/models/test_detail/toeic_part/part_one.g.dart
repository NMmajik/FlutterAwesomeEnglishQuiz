// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_one.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartOneAdapter extends TypeAdapter<PartOne> {
  @override
  final int typeId = 1;

  @override
  PartOne read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartOne(
      number: fields[0] as int,
      audioPath: fields[1] as String,
      picturePath: fields[2] as String,
      correctAns: fields[3] as int,
      transcriptA: fields[4] as String,
      transcriptB: fields[5] as String,
      transcriptC: fields[6] as String,
      transcriptD: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PartOne obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.audioPath)
      ..writeByte(2)
      ..write(obj.picturePath)
      ..writeByte(3)
      ..write(obj.correctAns)
      ..writeByte(4)
      ..write(obj.transcriptA)
      ..writeByte(5)
      ..write(obj.transcriptB)
      ..writeByte(6)
      ..write(obj.transcriptC)
      ..writeByte(7)
      ..write(obj.transcriptD);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartOneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
