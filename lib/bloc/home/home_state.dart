import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeDataState extends HomeState {
  Either<String, List<WeatherItem>> weatherItemList;
  HomeDataState(this.weatherItemList);
}
