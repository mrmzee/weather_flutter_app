import 'package:dio/dio.dart';
import 'package:weather/weather.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/api_exception.dart';
import 'package:weather_flutter_app/util/weather_key.dart';

abstract class IWeatherDataSource {
  Future<Weather> getWeatherDataList(String cityName);
}

class GetWeatherRemoteDataSource implements IWeatherDataSource {
  Dio dio = locator.get();

  @override
  Future<Weather> getWeatherDataList(String cityName) async {
    try {
      WeatherFactory weatherFactory = WeatherFactory(apiKey);
      Weather weather = await weatherFactory.currentWeatherByCityName(cityName);

      return weather;
    } catch (exs) {
      throw ApiException(0, 'The desired location was not found');
    }
  }
}
