import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class History {
  History({
    required this.dateTime,
    required this.question,
    required this.answer,
    required this.score,
  });

  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  Color question;

  @HiveField(2)
  HistoryAnswer answer;

  @HiveField(3)
  String score;
}

@HiveType(typeId: 2)
class HistoryAnswer {
  HistoryAnswer({
    required this.hsvColor,
    required this.rgbColor,
    required this.checkTimes,
  });

  @HiveField(0)
  HSVColor hsvColor;

  @HiveField(1)
  Color rgbColor;

  @HiveField(2)
  int checkTimes;
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 3;

  @override
  Color read(BinaryReader reader) {
    return Color(reader.read());
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.write(obj.value);
  }
}

class HSVColorAdapter extends TypeAdapter<HSVColor> {
  @override
  final typeId = 4;

  @override
  HSVColor read(BinaryReader reader) {
    return HSVColor.fromColor(Color(reader.read()));
  }

  @override
  void write(BinaryWriter writer, HSVColor obj) {
    writer.write(obj.toColor().value);
  }
}
