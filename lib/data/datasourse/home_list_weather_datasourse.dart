import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';

abstract class IhomeListWeatherDatasourse {
  Future<void> addWeather(WeatherItem weatherItem);
  Future<List<WeatherItem>> getWeatherItem();
}

class HomeListWeatherLocalDatasourse extends IhomeListWeatherDatasourse {
  var box = Hive.box<WeatherItem>('weatherBox');
  @override
  Future<void> addWeather(WeatherItem weatherItem) async {
    box.add(weatherItem);
  }

  @override
  Future<List<WeatherItem>> getWeatherItem() async {
    return box.values.toList();
  }
}
