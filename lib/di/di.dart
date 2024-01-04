import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
import 'package:weather_flutter_app/data/datasourse/fake_data.dart';
import 'package:weather_flutter_app/data/datasourse/home_list_weather_datasourse.dart';
import 'package:weather_flutter_app/data/datasourse/weather_datasourse.dart';
import 'package:weather_flutter_app/data/repository/home_list_weather_repository.dart';
import 'package:weather_flutter_app/data/repository/weather_repository.dart';

var locator = GetIt.I;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5'),
    ),
  );

  //datasource

  locator.registerFactory<IWeatherDataSource>(() => WebApiFake());
  locator.registerFactory<IHomeListWeatherDatasource>(
      () => HomeListWeatherLocalDatasource());

  //repository

  locator.registerFactory<IWeatherRepository>(() => WeatherRepository());
  locator.registerFactory<IHomeListWeatherRepository>(
      () => HomeListWeatherRepository());

  //bloc
  locator.registerSingleton<HomeBloc>(HomeBloc());
}
