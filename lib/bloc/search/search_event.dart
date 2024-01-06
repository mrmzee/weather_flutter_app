import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

abstract class SearchEvent extends Equatable {}

class SearchGetDataEvent extends SearchEvent {
  final String cityname;
  SearchGetDataEvent(this.cityname);

  @override
  List<Object?> get props => [cityname];
}

class WeatherAddToHomeEvent extends SearchEvent {
  final String cityName;
  final Weather weather;
  WeatherAddToHomeEvent(this.cityName, this.weather);

  @override
  List<Object?> get props => [cityName, weather];
}
