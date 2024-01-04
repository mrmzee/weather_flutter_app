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

    on<WeatherAddToHomeEvent>((event, emit) {
      var weatherItem =
          WeatherItem(event.weather.name, event.weather.temp, event.weather.dt);

      homeListWeatherRepository.addWeatherToHome(weatherItem);
    });
  }
}
