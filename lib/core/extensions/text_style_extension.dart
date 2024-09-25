import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle get labelStyle {
    return Theme.of(this).textTheme.titleMedium!;
  }

}
