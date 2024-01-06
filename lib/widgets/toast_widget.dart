import 'package:flutter/material.dart';

// toastWidget(context, String text, IconData icon, Color backgroundColor) {
//   CherryToast(
//     icon: icon,
//     backgroundColor: backgroundColor,
//     iconColor: MyColors.white,
//     themeColor: MyColors.white,
//     title: const Text(''),
//     displayTitle: false,
//     enableIconAnimation: false,
//     description: Text(
//       text,
//       style: const TextStyle(
//         fontSize: 16,
//         color: MyColors.white,
//       ),
//       textAlign: TextAlign.start,
//       textDirection: TextDirection.ltr,
//     ),
//     toastPosition: Position.bottom,
//     animationDuration: const Duration(milliseconds: 500),
//     autoDismiss: true,
//   ).show(context);
// }

void showToast(BuildContext context, String textToast) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(textToast),
    ),
  );
}
