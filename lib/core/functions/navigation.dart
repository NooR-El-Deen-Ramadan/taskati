import 'package:flutter/material.dart';

Future<void> pushWithoutReplacment({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

Future<void> pushWithReplacment({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

Future<void> pushAndRemove({required BuildContext context, required Widget screen}) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
