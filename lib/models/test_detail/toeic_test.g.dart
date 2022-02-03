// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toeic_test.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToeicTestAdapter extends TypeAdapter<ToeicTest> {
  @override
  final int typeId = 0;

  @override
  ToeicTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToeicTest(
      totalCorrectAnsPartOne: fields[10] as int,
      totalCorrectAnsPartTwo: fields[11] as int,
      totalCorrectAnsPartThree: fields[12] as int,
      totalCorrectAnsPartFour: fields[13] as int,
      title: fields[0] as String,
      des: fields[1] as String,
      ver: fields[2] as int,
      partOne: (fields[3] as List).cast<PartOne>(),
      partTwo: (fields[4] as List).cast<PartTwo>(),
      partThree: (fields[5] as List).cast<PartThree>(),
      partFour: (fields[6] as List).cast<PartFour>(),
    );
  }

  @override
  void write(BinaryWriter writer, ToeicTest obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.des)
      ..writeByte(2)
      ..write(obj.ver)
      ..writeByte(3)
      ..write(obj.partOne)
      ..writeByte(4)
      ..write(obj.partTwo)
      ..writeByte(5)
      ..write(obj.partThree)
      ..writeByte(6)
      ..write(obj.partFour)
      ..writeByte(10)
      ..write(obj.totalCorrectAnsPartOne)
      ..writeByte(11)
      ..write(obj.totalCorrectAnsPartTwo)
      ..writeByte(12)
      ..write(obj.totalCorrectAnsPartThree)
      ..writeByte(13)
      ..write(obj.totalCorrectAnsPartFour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToeicTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
