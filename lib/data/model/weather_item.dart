import 'package:hive_flutter/hive_flutter.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 0)
class WeatherItem {
  @HiveField(0)
  String name;
  @HiveField(1)
  double temp;
  @HiveField(2)
  int dt;
  @HiveField(3)
  double? degri;

  WeatherItem(this.name, this.temp, this.dt) {
    degri = temp - 273;
  }
}
