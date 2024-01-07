import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/data/model/weather_api_model.dart';
import 'package:weather_flutter_app/data/model/weather_data_model.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/api_exception.dart';

abstract class IWeatherRepository {
  Future<Either<String, WeatherData>> getWeatherData(String cityName);
  Future<Either<String, List<WeatherCity>>> getWeatherCityData(String cityName);
}

class WeatherRepository extends IWeatherRepository {
  final IWeatherDataSource _iWeatherDataSource = locator.get();

  @override
  Future<Either<String, WeatherData>> getWeatherData(String cityName) async {
    try {
      final response = await _iWeatherDataSource.getWeatherData(cityName);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }

  @override
  Future<Either<String, List<WeatherCity>>> getWeatherCityData(
      String cityName) async {
    try {
      final response =
          await _iWeatherDataSource.getCityByNameDataList(cityName);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }
}
