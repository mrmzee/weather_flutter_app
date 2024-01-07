import 'package:flutter/material.dart';
import 'package:weather_flutter_app/util/colors.dart';

class MyThemes {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.purple,
    colorScheme: const ColorScheme.dark(),
    primaryColor: MyColors.purple,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'KalameB',
        fontSize: 120,
        height: 1,
        color: MyColors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: 'KalameR',
        fontSize: 45,
        height: 1,
        color: MyColors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: 'KalameR',
        fontSize: 25,
        height: 1,
        color: MyColors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'KalameB',
        fontSize: 40,
        height: 1,
        color: MyColors.white,
      ),
    ),
  );
}
