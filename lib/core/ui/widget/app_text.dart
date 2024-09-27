import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tien_am/core/ui/styles/text_style.dart';

abstract final class AppText {
  static Text bold(
    String data, {
    FontSizes fontSize = FontSizes.normal,
    Color? textColor,
  }) =>
      Text(
        data,
        style: AppTextStyles.base(
          fontSize: fontSize.size,
          fontWeight: FontWeight.bold,
          textColor: textColor,
        ),
      );

  static Text base(
    String data, {
    FontSizes fontSize = FontSizes.normal,
    Color? textColor,
  }) =>
      Text(
        data,
        style: AppTextStyles.base(
          fontSize: fontSize.size,
          fontWeight: FontWeight.normal,
          textColor: textColor,
        ),
      );

  static Text medium(
    String data, {
    FontSizes fontSize = FontSizes.normal,
    Color? textColor,
  }) =>
      Text(
        data,
        style: AppTextStyles.base(
          textColor: textColor,
          fontSize: fontSize.size,
          fontWeight: FontWeight.w500,
        ),
      );
}

enum FontSizes {
  large(18),
  medium(16),
  small(12),
  normal(14);

  final double size;

  const FontSizes(this.size);
}
