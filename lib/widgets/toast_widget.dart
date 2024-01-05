import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter_app/util/colors.dart';

toastWidget(context, String text, IconData icon, Color backgroundColor) {
  CherryToast(
    icon: icon,
    backgroundColor: backgroundColor,
    iconColor: MyColors.white,
    themeColor: MyColors.white,
    title: const Text(''),
    displayTitle: false,
    enableIconAnimation: false,
    description: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: MyColors.white,
      ),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    ),
    toastPosition: Position.bottom,
    animationDuration: const Duration(milliseconds: 500),
    autoDismiss: true,
  ).show(context);
}
