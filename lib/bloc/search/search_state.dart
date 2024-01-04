import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/data/model/weather_model.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchGetDataState extends SearchState {
  Either<String, List<Weather>> getWeatherData;

  SearchGetDataState(this.getWeatherData);
}
