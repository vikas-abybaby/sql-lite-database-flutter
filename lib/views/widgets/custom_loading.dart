import "dart:developer";
import "package:flutter/material.dart";
import "package:todo/Router/routing_service.dart";
import "package:todo/views/widgets/color_const.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
// ignore_for_file: deprecated_member_use

Future<void> showLoading() async {
  try {
    await showDialog(
      context: RoutingService.navigatorKey.currentContext!,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: ColoredBox(
          color: white.withOpacity(0.6),
          child: LoadingAnimationWidget.newtonCradle(color: black, size: 100),
        ),
      ),
    );
  } catch (e) {
    log("showLoading :- ${e.toString()}");
  }
}
