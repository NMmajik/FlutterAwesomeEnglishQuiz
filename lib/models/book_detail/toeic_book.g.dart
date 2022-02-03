// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toeic_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToeicBookAdapter extends TypeAdapter<ToeicBook> {
  @override
  final int typeId = 11;

  @override
  ToeicBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToeicBook(
      id: fields[0] as int,
      title: fields[1] as String,
      des: fields[2] as String,
      author: fields[3] as String,
      coverUrl: fields[4] as String,
      price: fields[5] as int,
      testInfos: (fields[6] as List).cast<TestInfo>(),
    );
  }

  @override
  void write(BinaryWriter writer, ToeicBook obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.des)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.coverUrl)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.testInfos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToeicBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
