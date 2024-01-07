import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_flutter_app/data/model/weather_condition_code_model.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 0)
class WeatherItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int degree;

  @HiveField(2)
  WeatherConditionCodeModel weatherCode;

  @HiveField(3)
  int date;

  @HiveField(4)
  int timezone;

  WeatherItem(
    this.name,
    this.degree,
    this.weatherCode,
    this.date,
    this.timezone,
  );
}
