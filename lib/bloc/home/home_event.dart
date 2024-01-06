import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class WeatherGetHiveDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DismissWeatherItemEvent extends HomeEvent {
  final int index;

  DismissWeatherItemEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class FirstAddWeatherItemEvent extends HomeEvent {
  FirstAddWeatherItemEvent();

  @override
  List<Object?> get props => [];
}

class RefreshHomeEvent extends HomeEvent {
  RefreshHomeEvent();

  @override
  List<Object?> get props => [];
}
