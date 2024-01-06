import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/util/colors.dart';
import 'package:weather_flutter_app/widgets/weater_icon_widget.dart';

class WeatherHomeBox extends StatefulWidget {
  final WeatherItem weatherItem;

  const WeatherHomeBox({Key? key, required this.weatherItem}) : super(key: key);

  @override
  WeatherHomeBoxState createState() => WeatherHomeBoxState();
}

class WeatherHomeBoxState extends State<WeatherHomeBox> {
  // late DateTime currentTime;
  late Timer timer;

  @override
  @override
  void initState() {
    super.initState();
    // currentTime = widget.weatherItem.date;
    // timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
    //   setState(() {
    //     currentTime = widget.weatherItem.date;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
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
            child: weatherIconWidget(
                widget.weatherItem.weatherCode, widget.weatherItem.date),
          ),
          Positioned(
            top: 70,
            left: 50,
            child: Text(
              '${widget.weatherItem.degree}°',
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
              widget.weatherItem.name,
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
              DateFormat('EEEE dd .').add_Hm().format(widget.weatherItem.date),
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

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
