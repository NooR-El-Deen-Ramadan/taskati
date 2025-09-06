import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: EdgeInsets.all(20),
      content: Text(message),
    ),
  );
}
