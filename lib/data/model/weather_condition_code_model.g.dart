// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_condition_code_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherConditionCodeModelAdapter
    extends TypeAdapter<WeatherConditionCodeModel> {
  @override
  final int typeId = 2;

  @override
  WeatherConditionCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherConditionCodeModel(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherConditionCodeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.weatherConditionCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherConditionCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
