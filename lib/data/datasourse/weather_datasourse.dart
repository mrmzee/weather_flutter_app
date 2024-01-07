import 'package:dio/dio.dart';
import 'package:weather_flutter_app/data/model/weather_api_model.dart';
import 'package:weather_flutter_app/data/model/weather_data_model.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/api_exception.dart';
import 'package:weather_flutter_app/util/weather_key.dart';

abstract class IWeatherDataSource {
  Future<List<WeatherCity>> getCityByNameDataList(String cityName);
  Future<WeatherData> getWeatherData(String cityName);
}

class GetWeatherRemoteDataSource implements IWeatherDataSource {
  Dio dio = locator.get();

  @override
  Future<WeatherData> getWeatherData(String cityName) async {
    try {
      var response =
          await dio.get('/data/2.5/weather?q=$cityName&appid=$apiKey');

      var jsonMapObject = await response.data;
      var listData = WeatherData.fromJson(jsonMapObject);

      return listData;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unspecified error');
    }
  }

  @override
  Future<List<WeatherCity>> getCityByNameDataList(String cityName) async {
    try {
      var response =
          await dio.get('/geo/1.0/direct?q=$cityName&limit=25&appid=$apiKey');

      var listData = (response.data as List)
          .map<WeatherCity>(
            (jsonMap) => WeatherCity.fromJson(jsonMap),
          )
          .toList();

      return listData;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unspecified error');
    }
  }
}
