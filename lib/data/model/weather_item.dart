import 'package:hive_flutter/hive_flutter.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 0)
class WeatherItem {
  @HiveField(0)
  String name;
  @HiveField(1)
  int degree;

  @HiveField(2)
  int weatherCode;

  @HiveField(3)
  DateTime date;

  WeatherItem(this.name, this.degree, this.weatherCode, this.date);
}
