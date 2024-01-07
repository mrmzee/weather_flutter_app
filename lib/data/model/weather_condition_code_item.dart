import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class WeatherConditionCodeModel {
  @HiveField(0)
  int weatherConditionCode;

  WeatherConditionCodeModel(this.weatherConditionCode);
}
