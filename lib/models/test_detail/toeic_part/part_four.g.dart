// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_four.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartFourAdapter extends TypeAdapter<PartFour> {
  @override
  final int typeId = 4;

  @override
  PartFour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartFour(
      audioPath: fields[0] as String,
      picturePath: fields[1] as String?,
      transcript: fields[2] as String,
      groupQuestion: (fields[3] as List).cast<GroupQuestion>(),
    );
  }

  @override
  void write(BinaryWriter writer, PartFour obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.audioPath)
      ..writeByte(1)
      ..write(obj.picturePath)
      ..writeByte(2)
      ..write(obj.transcript)
      ..writeByte(3)
      ..write(obj.groupQuestion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartFourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
