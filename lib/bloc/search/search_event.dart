import 'package:weather_flutter_app/data/model/weather_model.dart';

abstract class SearchEvent {}

class SearchGetDataEvent extends SearchEvent {
  String cityname;
  SearchGetDataEvent(this.cityname);
}

class WeatherAddToHomeEvent extends SearchEvent {
  Weather weather;
  WeatherAddToHomeEvent(this.weather);
}
