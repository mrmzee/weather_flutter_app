import 'package:flutter/material.dart';

void showToast(BuildContext context, String textToast) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Text(textToast),
    ),
  );
}
