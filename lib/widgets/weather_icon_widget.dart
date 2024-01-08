import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_app/data/model/weather_condition_code_model.dart';
import 'package:weather_flutter_app/util/images.dart';

Widget weatherIconWidget(WeatherConditionCodeModel code, int time) {
  var utcTime = DateTime.now().toUtc();
  var localTime = utcTime.add(
    Duration(seconds: time),
  );

  int dateTime = int.parse(DateFormat().add_H().format(localTime));

  if (dateTime >= 6 && dateTime <= 18) {
    switch (code.weatherConditionCode) {
      case > 200 && <= 300:
        return Image.asset(dayStormImage);
      case > 300 && <= 600:
        return Image.asset(dayRainImage);

      case > 600 && <= 700:
        return Image.asset(daySnowImage);
      case > 700 && <= 800:
        return Image.asset(dayWindImage);
      case == 800:
        return Image.asset(daySunImage);
      case > 800 && <= 804:
        return Image.asset(dayCloudsImage);

      default:
        return Image.asset(dayStormImage);
    }
  } else {
    switch (code.weatherConditionCode) {
      case > 200 && <= 300:
        return Image.asset(nightStormImage);
      case > 300 && <= 600:
        return Image.asset(nightRainImage);

      case > 600 && <= 700:
        return Image.asset(nightSnowImage);
      case > 700 && <= 800:
        return Image.asset(nightWindImage);
      case == 800:
        return Image.asset(nightMoonImage);
      case > 800 && <= 804:
        return Image.asset(nightCloudsImage);

      default:
        return Image.asset(nightMoonImage);
    }
  }
}
