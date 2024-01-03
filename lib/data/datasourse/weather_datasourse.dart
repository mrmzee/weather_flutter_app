import 'package:dio/dio.dart';
import 'package:weather_flutter_app/data/model/weather_model.dart';
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
      var response =
          await dio.get('/weather?q=$cityName&appid=${APIKeys.apiKey}');
      var jsonMapObject = await response.data;
      var listData = Weather.fromJson(jsonMapObject);
      return listData;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.statusMessage);
    }
  }
}
