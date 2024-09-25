
import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color white = Color(0xffffffff);

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Colors.deepOrangeAccent,
      Colors.orangeAccent,
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
}
