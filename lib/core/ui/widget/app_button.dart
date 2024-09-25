import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class AppButton extends ElevatedButton {
  AppButton({
    super.key,
    required super.onPressed,
    String title = '',
    super.focusNode,
    super.autofocus,
    Color? titleColor,
    Decoration? decoration,
  }) : super(
          child: AppText.medium(
            title,
            textColor: titleColor,
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 11,
            ),

            backgroundBuilder: (context, states, child) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.orangeGradient,
                ),
                child: child,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
}

class AppIconButton extends IconButton {
  AppIconButton({
    super.key,
    required super.onPressed,
    required super.icon,
  }) : super.outlined(
          style: IconButton.styleFrom(

          ),
        );

}
