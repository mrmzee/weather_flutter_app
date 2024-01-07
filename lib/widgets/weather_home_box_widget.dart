import 'package:flutter/material.dart';
import 'package:weather_flutter_app/data/model/weather_item.dart';
import 'package:weather_flutter_app/util/local_time.dart';
import 'package:weather_flutter_app/widgets/weater_icon_widget.dart';

class WeatherHomeBox extends StatefulWidget {
  final WeatherItem weatherItem;

  const WeatherHomeBox({
    Key? key,
    required this.weatherItem,
  }) : super(key: key);

  @override
  WeatherHomeBoxState createState() => WeatherHomeBoxState();
}

class WeatherHomeBoxState extends State<WeatherHomeBox> {
  // late DateTime currentTime;

  @override
  void initState() {
    super.initState();
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
              widget.weatherItem.weatherCode,
              widget.weatherItem.timezone,
            ),
          ),
          Positioned(
            top: 15,
            left: 50,
            child: Text(
              '${widget.weatherItem.degree}°',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
            top: 110,
            left: 50,
            child: Text(
              widget.weatherItem.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Positioned(
            top: 135,
            left: 50,
            child: Text(
              localTime(widget.weatherItem.timezone),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
