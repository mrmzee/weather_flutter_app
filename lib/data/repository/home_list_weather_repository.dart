import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/datasourse/home_list_weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/di/di.dart';

abstract class IHomeListWeatherRepository {
  Future<Either<String, String>> addWeatherToHome(WeatherItem weatherItem);
  Future<Either<String, List<WeatherItem>>> getWeatherItem();
  Future<Either<String, String>> deleteWeather(int index);
}

class HomeListWeatherRepository extends IHomeListWeatherRepository {
  final IHomeListWeatherDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> addWeatherToHome(
      WeatherItem weatherItem) async {
    try {
      await _datasource.addWeather(weatherItem);
      return right('به لیست شما اضافه شد');
    } catch (e) {
      return left('خطایی رخ داده است');
    }
  }

  @override
  Future<Either<String, List<WeatherItem>>> getWeatherItem() async {
    try {
      var weatherList = await _datasource.getWeatherItem();
      return right(weatherList);
    } catch (e) {
      return left('خطایی در نمایش لیست آب و هوا رخ داده است!');
    }
  }

  @override
  Future<Either<String, String>> deleteWeather(int index) async {
    try {
      await _datasource.deleteWeather(index);
      return right('آب و هوا حذف شد');
    } catch (e) {
      return left('خطایی رخ داده است');
    }
  }
}
