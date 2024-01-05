import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/weater_icon_widget.dart';

Widget weatherHomeBox(WeatherItem weatherItem) {
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
          child: weatherIconWidget(weatherItem.weatherCode, weatherItem.date),
        ),
        Positioned(
          top: 70,
          left: 50,
          child: Text(
            '${weatherItem.degree}°',
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 64,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 50,
          child: Text(
            weatherItem.name,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 25,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 50,
          child: Text(
            DateFormat('EEEE dd .').add_Hm().format(weatherItem.date),
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 25,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0.01,
              letterSpacing: 0.37,
            ),
          ),
        ),
      ],
    ),
  );
}
