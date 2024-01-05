import 'package:weather/weather.dart';

abstract class SearchEvent {}

class SearchGetDataEvent extends SearchEvent {
  String cityname;
  SearchGetDataEvent(this.cityname);
}

class WeatherAddToHomeEvent extends SearchEvent {
  Weather weather;
  WeatherAddToHomeEvent(this.weather);
}
