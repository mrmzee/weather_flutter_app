import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/datasourse/home_list_weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/di/di.dart';

abstract class IHomeListWeatherRepository {
  Future<Either<String, String>> addWeatherToHome(WeatherItem weatherItem);
  Future<Either<String, List<WeatherItem>>> getWeatherItem();
}

class HomeListWeatherRepository extends IHomeListWeatherRepository {
  final IhomeListWeatherDatasourse _datasourse = locator.get();
  @override
  Future<Either<String, String>> addWeatherToHome(
      WeatherItem weatherItem) async {
    try {
      _datasourse.addWeather(weatherItem);
      return right('به لیست شما اضافه شد');
    } catch (e) {
      return left('خطایی رخ داده است');
    }
  }

  @override
  Future<Either<String, List<WeatherItem>>> getWeatherItem() async {
    try {
      var weatherList = await _datasourse.getWeatherItem();
      return right(weatherList);
    } catch (e) {
      return left('خطایی در نمایش لیست آب و هوا رخ داده است!');
    }
  }
}
