import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/model/weather_api_model.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchAddState extends SearchState {}

class SearchGetDataState extends SearchState {
  Either<String, List<WeatherCity>> getWeatherCityData;

  SearchGetDataState(this.getWeatherCityData);
}
