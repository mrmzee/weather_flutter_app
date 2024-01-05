import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchAddState extends SearchState {}

class SearchGetDataState extends SearchState {
  Either<String, Weather> getWeatherData;

  SearchGetDataState(this.getWeatherData);
}
