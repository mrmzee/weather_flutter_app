import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_flutter_app/bloc/home/home_event.dart';
import 'package:weather_flutter_app/bloc/home/home_state.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/data/repository/home_list_weather_repository.dart';
import 'package:weather_flutter_app/data/repository/weather_repository.dart';
import 'package:weather_flutter_app/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeListWeatherRepository _homeListWeatherRepository = locator.get();
  final IWeatherRepository weatherRepository = locator.get();
  final SharedPreferences _preferences = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<WeatherGetHiveDataEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        bool isFirstTime = (_preferences.getBool('first_time') ?? true);
        if (isFirstTime == true) {
          add(FirstAddWeatherItemEvent());
          _preferences.setBool('first_time', false);
        }
        var weatherList = await _homeListWeatherRepository.getWeatherItem();
        emit(HomeDataState(weatherList));
      },
    );

    on<DismissWeatherItemEvent>(
      (event, emit) async {
        await _homeListWeatherRepository.deleteWeather(event.index);
        var weatherList = await _homeListWeatherRepository.getWeatherItem();
        emit(HomeDataState(weatherList));
      },
    );

    on<FirstAddWeatherItemEvent>(
      (event, emit) async {
        List<String> cityNames = ['tehran', 'dubai', 'london', 'new york'];

        List<Future<void>> weatherFutures = [];

        for (var cityName in cityNames) {
          var weatherFuture = weatherRepository.getWeatherData(cityName).then(
            (weatherData) {
              weatherData.fold(
                (error) {},
                (response) async {
                  var weatherItem = WeatherItem(
                    response.name,
                    response.getTempInCelsius().round(),
                    response.weatherConditionCode,
                    response.date,
                    response.timezone,
                  );

                  _homeListWeatherRepository.addWeatherToHome(
                    response.name,
                    weatherItem,
                  );
                },
              );
            },
          );

          weatherFutures.add(weatherFuture);
        }

        await Future.wait(weatherFutures);

        add(WeatherGetHiveDataEvent());
      },
    );

    on<RefreshHomeEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var itemKeys = await _homeListWeatherRepository.getWeatherItemKeys();

        itemKeys.fold(
          (error) {},
          (respons) async {
            List<Future<void>> weatherFutures = [];

            for (var cityName in respons) {
              var weatherFuture =
                  weatherRepository.getWeatherData(cityName.name).then(
                (weatherData) {
                  weatherData.fold(
                    (error) {},
                    (response) async {
                      var weatherItem = WeatherItem(
                        response.name,
                        response.getTempInCelsius().round(),
                        response.weatherConditionCode,
                        response.date,
                        response.timezone,
                      );

                      _homeListWeatherRepository.addWeatherToHome(
                        response.name,
                        weatherItem,
                      );
                    },
                  );
                },
              );

              weatherFutures.add(weatherFuture);
            }

            await Future.wait(weatherFutures);

            add(WeatherGetHiveDataEvent());
          },
        );
      },
    );
  }
}
