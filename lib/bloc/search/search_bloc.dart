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
        var weatheCityData =
            await weatherRepository.getWeatherCityData(event.cityname);

        emit(
          SearchGetDataState(weatheCityData),
        );
      },
    );

    on<WeatherAddToHomeEvent>(
      (event, emit) async {
        var weatheData = await weatherRepository.getWeatherData(event.cityName);

        weatheData.fold(
          (error) {},
          (response) {
            var weatherItem = WeatherItem(
              response.name,
              response.getTempInCelsius().round(),
              response.weatherConditionCode,
              response.date,
              response.timezone,
            );

            homeListWeatherRepository.addWeatherToHome(
              response.name,
              weatherItem,
            );
          },
        );
      },
    );
  }
}
