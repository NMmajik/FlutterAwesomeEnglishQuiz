// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupQuestionAdapter extends TypeAdapter<GroupQuestion> {
  @override
  final int typeId = 10;

  @override
  GroupQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupQuestion(
      number: fields[0] as int,
      correctAns: fields[1] as int,
      questionStr: fields[2] as String,
      ansA: fields[3] as String,
      ansB: fields[4] as String,
      ansC: fields[5] as String,
      ansD: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GroupQuestion obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.correctAns)
      ..writeByte(2)
      ..write(obj.questionStr)
      ..writeByte(3)
      ..write(obj.ansA)
      ..writeByte(4)
      ..write(obj.ansB)
      ..writeByte(5)
      ..write(obj.ansC)
      ..writeByte(6)
      ..write(obj.ansD);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
