// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherItemAdapter extends TypeAdapter<WeatherItem> {
  @override
  final int typeId = 0;

  @override
  WeatherItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherItem(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.degree)
      ..writeByte(2)
      ..write(obj.weatherCode)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
