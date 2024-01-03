import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';

var locator = GetIt.I;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5'),
    ),
  );

  //datasource

  locator
      .registerFactory<IWeatherDataSource>(() => GetWeatherRemoteDataSource());

  //repository
}
