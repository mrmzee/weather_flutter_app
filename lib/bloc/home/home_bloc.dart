import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/bloc/home/home_state.dart';
import 'package:weather_flutter_app/data/repository/home_list_weather_repository.dart';
import 'package:weather_flutter_app/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeListWeatherRepository _homeListWeatherRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<WeatherGetHiveDataEvent>((event, emit) async {
      var weatherList = await _homeListWeatherRepository.getWeatherItem();
      emit(HomeDataState(weatherList));
    });
  }
}
