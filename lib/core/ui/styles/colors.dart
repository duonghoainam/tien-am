import 'package:flutter/material.dart';

abstract final class AppColors {


  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      peach,
      orange,
    ],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      .1,
      .9,
    ],
    colors: [
      Colors.blueGrey,
      Colors.white,
    ],
  );

  static const Color peach = Color(0xFFf07971);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffA9A9A9);
  static const Color lightGrey = Color(0xa9A9A9A9);
  static const Color darkGrey = Color(0xff808080);
  static const Color orange = Color(0xfff1a669);
  static const Color green = Colors.teal;
  static const Color lightGreen = Colors.greenAccent;

  static const Color lightPink = Color(0xffEAD8D9);
}
