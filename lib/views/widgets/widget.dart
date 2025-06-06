import 'package:flutter/material.dart';
import 'package:todo/views/widgets/color_const.dart';

/// Screen size
double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Barlow-Regular
Widget barlowRegular({
  String text = "",
  double size = 10,
  TextOverflow? overflow,
  Color? color,
  int? maxLine,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      overflow: overflow,
      color: color,
      fontSize: size,
      fontFamily: "Barlow",
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );
}

/// text style
Widget barlowBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  TextAlign? textAlign,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    overflow: overflow ?? TextOverflow.ellipsis,
    maxLines: maxLine ?? 5,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? black.withOpacity(0.8),
      fontSize: size,
      fontFamily: "Barlow",
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}
