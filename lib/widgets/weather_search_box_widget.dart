import 'package:flutter/widgets.dart';
import 'package:weather_flutter_app/util/colors.dart';

Widget weatherSearchBox(String name, double dg) {
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
          child: Image.asset('assets/images/Day_Snow.png'),
        ),
        Positioned(
          top: 70,
          left: 50,
          child: Text(
            '$dg°',
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
            name,
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
        const Positioned(
          top: 150,
          left: 50,
          child: Text(
            '20:20',
            style: TextStyle(
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
