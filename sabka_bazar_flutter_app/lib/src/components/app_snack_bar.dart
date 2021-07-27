import 'package:flutter/material.dart';

class AppSnackBar {
  static void showSnackBar(BuildContext context, String message, int duration) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.pink.shade800,
      duration: Duration(seconds: duration),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
