import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/datasourse/home_list_weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/di/di.dart';

abstract class IHomeListWeatherRepository {
  Future<Either<String, String>> addWeatherToHome(
      String cityName, WeatherItem weatherItem);
  Future<Either<String, List<WeatherItem>>> getWeatherItem();
  Future<Either<String, String>> deleteWeather(int index);
}

class HomeListWeatherRepository extends IHomeListWeatherRepository {
  final IHomeListWeatherDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> addWeatherToHome(
      String cityName, WeatherItem weatherItem) async {
    try {
      await _datasource.addWeather(cityName, weatherItem);
      return right('Added to your list');
    } catch (e) {
      return left('An error has occurred');
    }
  }

  @override
  Future<Either<String, List<WeatherItem>>> getWeatherItem() async {
    try {
      var weatherList = await _datasource.getWeatherItem();
      return right(weatherList);
    } catch (e) {
      return left('An error occurred in displaying the weather list!');
    }
  }

  @override
  Future<Either<String, String>> deleteWeather(int index) async {
    try {
      await _datasource.deleteWeather(index);
      return right('weather removed');
    } catch (e) {
      return left('An error has occurred');
    }
  }
}
