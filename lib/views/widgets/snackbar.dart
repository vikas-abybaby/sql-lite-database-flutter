import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:todo/Router/routing_service.dart';

class SnackBarData {
  static topShowSnackBar(String content, Color color, {Duration? duration}) {
    return Flushbar(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      margin: const EdgeInsets.all(20),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      backgroundColor: color,
      isDismissible: true,
      duration: duration ?? const Duration(seconds: 3),
      messageText: Text(
        content,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "ShadowsIntoLightTwo",
        ),
      ),
    ).show(RoutingService.navigatorKey.currentContext!);
  }

  static simpleSnackBar(
    BuildContext context,
    String content,
    Color color, {
    Duration? duration,
  }) {
    // print("viku ${content}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(milliseconds: 500),
        backgroundColor: color,
        content: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
