import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget weatherIconWidget(int code, DateTime time) {
  int dateTime = int.parse(DateFormat().add_H().format(time));
  if (dateTime >= 6 && dateTime <= 18) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('assets/images/Day_Storm.png');
      case > 300 && <= 600:
        return Image.asset('assets/images/Day_Rain.png');

      case > 600 && <= 700:
        return Image.asset('assets/images/Day_Snow.png');
      case > 700 && <= 800:
        return Image.asset('assets/images/Day_Wind.png');
      case == 800:
        return Image.asset('assets/images/Day_Sun.png');
      case > 800 && <= 804:
        return Image.asset('assets/images/Day_Clouds.png');

      default:
        return Image.asset('assets/images/Day_Storm.png');
    }
  } else {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('assets/images/Night_Storm.png');
      case > 300 && <= 600:
        return Image.asset('assets/images/Night_Rain.png');

      case > 600 && <= 700:
        return Image.asset('assets/images/Night_Snow.png');
      case > 700 && <= 800:
        return Image.asset('assets/images/Night_Wind.png');
      case == 800:
        return Image.asset('assets/images/Night_Moon.png');
      case > 800 && <= 804:
        return Image.asset('assets/images/Night_Clouds.png');

      default:
        return Image.asset('assets/images/Night_Moon.png');
    }
  }
}
