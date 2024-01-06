abstract class HomeEvent {}

class WeatherGetHiveDataEvent extends HomeEvent {}

class DismissWeatherItemEvent extends HomeEvent {
  final int index;

  DismissWeatherItemEvent(this.index);
}

class FirstAddWeatherItemEvent extends HomeEvent {
  FirstAddWeatherItemEvent();
}
