// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 1;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      dateTime: fields[0] as DateTime,
      question: fields[1] as Color,
      answer: fields[2] as HistoryAnswer,
      score: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer)
      ..writeByte(3)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryAnswerAdapter extends TypeAdapter<HistoryAnswer> {
  @override
  final int typeId = 2;

  @override
  HistoryAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryAnswer(
      hsvColor: fields[0] as HSVColor,
      rgbColor: fields[1] as Color,
      checkTimes: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryAnswer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hsvColor)
      ..writeByte(1)
      ..write(obj.rgbColor)
      ..writeByte(2)
      ..write(obj.checkTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
