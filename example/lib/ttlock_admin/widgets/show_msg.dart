import 'package:flutter/material.dart';

void showMsg(BuildContext context,
    {required String message, Color? backgroundColor, Duration? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: backgroundColor,
    content: Text(
      message ?? "",
      style: TextStyle(
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    ),
    duration: duration ?? Duration(milliseconds: 4000),
  ));
}
