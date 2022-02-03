// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestInfoAdapter extends TypeAdapter<TestInfo> {
  @override
  final int typeId = 12;

  @override
  TestInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestInfo(
      title: fields[0] as String,
      size: fields[1] as String,
      questionNumber: fields[2] as int,
      ver: fields[3] as int,
      resourceUrl: fields[4] as String,
      score: fields[5] as int,
      downloaded: fields[6] as bool,
      boxId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TestInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.questionNumber)
      ..writeByte(3)
      ..write(obj.ver)
      ..writeByte(4)
      ..write(obj.resourceUrl)
      ..writeByte(5)
      ..write(obj.score)
      ..writeByte(6)
      ..write(obj.downloaded)
      ..writeByte(7)
      ..write(obj.boxId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
