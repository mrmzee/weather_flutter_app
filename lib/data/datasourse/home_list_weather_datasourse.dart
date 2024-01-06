import 'package:hive/hive.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';

abstract class IHomeListWeatherDatasource {
  Future<void> addWeather(String cityName, WeatherItem weatherItem);
  Future<List<WeatherItem>> getWeatherItem();
  Future<void> deleteWeather(int index);
}

class HomeListWeatherLocalDatasource implements IHomeListWeatherDatasource {
  var box = Hive.box<WeatherItem>('weatherBox');

  @override
  Future<void> addWeather(String cityName, WeatherItem weatherItem) async {
    await box.put(cityName, weatherItem);
  }

  @override
  Future<List<WeatherItem>> getWeatherItem() async {
    return box.values.toList();
  }

  @override
  Future<void> deleteWeather(int index) async {
    await box.deleteAt(index);
  }
}
