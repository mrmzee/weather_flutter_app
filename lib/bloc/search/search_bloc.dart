import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/bloc/search/search_event.dart';
import 'package:weather_flutter_app/bloc/search/search_state.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/data/repository/home_list_weather_repository.dart';
import 'package:weather_flutter_app/data/repository/weather_repository.dart';
import 'package:weather_flutter_app/di/di.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitState()) {
    final IWeatherRepository weatherRepository = locator.get();
    final IHomeListWeatherRepository homeListWeatherRepository = locator.get();

    on<SearchGetDataEvent>(
      (event, emit) async {
        emit(
          SearchLoadingState(),
        );
        var weatheData = await weatherRepository.getWeatherData(event.cityname);
        emit(
          SearchGetDataState(weatheData),
        );
      },
    );

    on<WeatherAddToHomeEvent>(
      (event, emit) async {
        var weatherItem = WeatherItem(
            event.weather.areaName!,
            event.weather.temperature!.celsius!.round(),
            event.weather.weatherConditionCode!,
            event.weather.date!);

        homeListWeatherRepository.addWeatherToHome(
            event.weather.areaName!, weatherItem);
      },
    );
  }
}
