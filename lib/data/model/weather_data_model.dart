import 'package:weather_flutter_app/data/model/weather_condition_code_model.dart';

class WeatherData {
  String name;
  String country;
  int date;
  int sunrise;
  int sunset;
  String state;
  double tempInKelvin;
  int timezone;
  WeatherConditionCodeModel weatherConditionCode;

  WeatherData(
    this.name,
    this.country,
    this.date,
    this.sunrise,
    this.sunset,
    this.state,
    this.tempInKelvin,
    this.timezone,
    this.weatherConditionCode,
  );

  double getTempInCelsius() {
    return tempInKelvin - 273.15;
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      json['name'],
      json['sys']['country'],
      json['dt'],
      json['sys']['sunrise'],
      json['sys']['sunset'],
      json['state'] ?? '',
      json['main']['temp'],
      json['timezone'],
      WeatherConditionCodeModel.fromJson(json['weather'][0]),
    );
  }
}
