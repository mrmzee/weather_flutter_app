import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';

abstract class HomeState extends Equatable {}

class HomeInitState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeDataState extends HomeState {
  final Either<String, List<WeatherItem>> weatherItemList;

  HomeDataState(this.weatherItemList);

  @override
  List<Object?> get props => [weatherItemList];
}

class HomeDeleteState extends HomeState {
  final Either<String, String> deleteResult;

  HomeDeleteState(this.deleteResult);

  @override
  List<Object?> get props => [deleteResult];
}

class HomeRefreshState extends HomeState {
  final Either<String, List<WeatherItem>> getWeatherItemKeys;
  HomeRefreshState(this.getWeatherItemKeys);
  @override
  List<Object?> get props => [];
}
