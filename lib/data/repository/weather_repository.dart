import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_api_model.dart';
import 'package:weather_flutter_app/data/model/weather_data_model.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/safe_api_call.dart';

abstract class IWeatherRepository {
  Future<Either<String, WeatherData>> getWeatherData(String cityName);
  Future<Either<String, List<WeatherCity>>> getWeatherCityData(String cityName);
}

class WeatherRepository extends IWeatherRepository {
  final IWeatherDataSource _iWeatherDataSource = locator.get();

  @override
  Future<Either<String, WeatherData>> getWeatherData(String cityName) async {
    return safeApiCall<WeatherData>(() async {
      return await _iWeatherDataSource.getWeatherData(cityName);
    });
  }

  @override
  Future<Either<String, List<WeatherCity>>> getWeatherCityData(
      String cityName) async {
    return safeApiCall<List<WeatherCity>>(() async {
      return _iWeatherDataSource.getCityByNameDataList(cityName);
    });
  }
}
