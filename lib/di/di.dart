import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_flutter_app/bloc/home/home_bloc.dart';
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

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // datasource
  locator
      .registerFactory<IWeatherDataSource>(() => GetWeatherRemoteDataSource());
  locator.registerFactory<IHomeListWeatherDatasource>(
      () => HomeListWeatherLocalDatasource());

  // repository
  locator.registerFactory<IWeatherRepository>(() => WeatherRepository());
  locator.registerFactory<IHomeListWeatherRepository>(
      () => HomeListWeatherRepository());

  locator.registerSingleton<HomeBloc>(HomeBloc());
}
