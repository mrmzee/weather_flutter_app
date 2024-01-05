import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';
import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/di/di.dart';
import 'package:weather_flutter_app/util/api_exception.dart';

abstract class IWeatherRepository {
  Future<Either<String, Weather>> getWeatherData(String cityName);
}

class WeatherRepository extends IWeatherRepository {
  final IWeatherDataSource _iWeatherDataSource = locator.get();

  @override
  Future<Either<String, Weather>> getWeatherData(String cityName) async {
    try {
      final response = await _iWeatherDataSource.getWeatherDataList(cityName);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }
}
