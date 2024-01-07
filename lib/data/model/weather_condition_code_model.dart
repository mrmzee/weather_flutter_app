import 'package:hive_flutter/hive_flutter.dart';
part 'weather_condition_code_model.g.dart';

@HiveType(typeId: 2)
class WeatherConditionCodeModel extends HiveObject {
  @HiveField(0)
  int weatherConditionCode;

  WeatherConditionCodeModel(this.weatherConditionCode);

  factory WeatherConditionCodeModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionCodeModel(
      json['id'],
    );
  }
}
