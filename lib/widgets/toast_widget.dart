import 'package:flutter/material.dart';

void showToast(BuildContext context, String textToast) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(textToast),
    ),
  );
}
