import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/weater_icon_widget.dart';

Widget weatherSearchBox(Weather weather) {
  DateTime? weatherDate = weather.date;

  String formattedDateTime =
      DateFormat('EEEE dd . HH:mm').format(weatherDate!.toUtc()).toString();

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset('assets/images/weather_box.png'),
        Positioned(
          top: -5,
          right: 20,
          bottom: 20,
          child:
              weatherIconWidget(weather.weatherConditionCode!, weather.date!),
        ),
        Positioned(
          top: 70,
          left: 50,
          child: Text(
            '${weather.temperature!.celsius!.round()}°',
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 64,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 50,
          child: Text(
            '${weather.areaName}',
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 25,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 50,
          child: Text(
            formattedDateTime,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 25,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
      ],
    ),
  );
}
