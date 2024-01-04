import 'package:dio/dio.dart';
import 'package:weather_flutter_app/data/model/weather_model.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/api_exception.dart';
import 'package:weather_flutter_app/util/weather_key.dart';

abstract class IWeatherDataSource {
  Future<List<Weather>> getWeatherDataList(String cityName);
}

class GetWeatherRemoteDataSource implements IWeatherDataSource {
  Dio dio = locator.get();

  @override
  Future<List<Weather>> getWeatherDataList(String cityName) async {
    try {
      var response =
          await dio.get('/weather?q=$cityName&appid=${APIKeys.apiKey}');

      var listData = (response.data['list'] as List)
          .map<Weather>(
            (jsonMap) => Weather.fromJson(jsonMap),
          )
          .toList();

      return listData;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'ارور نامشخص');
    }
  }
}
