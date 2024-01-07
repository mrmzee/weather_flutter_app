import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {}

class SearchGetDataEvent extends SearchEvent {
  final String cityname;
  SearchGetDataEvent(this.cityname);

  @override
  List<Object?> get props => [cityname];
}

class WeatherAddToHomeEvent extends SearchEvent {
  final int index;
  final String cityName;
  WeatherAddToHomeEvent(this.index, this.cityName);

  @override
  List<Object?> get props => [index, cityName];
}
