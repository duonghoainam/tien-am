import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class AppButton extends FilledButton {
  AppButton({
    super.key,
    required super.onPressed,
    String label = '',
    super.focusNode,
    super.autofocus,
    Color? titleColor,
    Decoration? decoration,
    Widget? icon,
  }) : super(
          child: AppText.medium(
            label,
            textColor: titleColor,
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 11,
            ),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.comfortable,
            backgroundBuilder: (context, states, child) {
              final active = states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered);
              return AnimatedScale(
                scale: active ? .95 : 1.0,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    gradient: AppColors.orangeGradient,
                  ),
                  child: child,
                ),
              );
            },
          ),
        );
}

class AppIconButton extends IconButton {
  AppIconButton({
    super.key,
    required super.onPressed,
    required super.icon,
    Color? backgroundColor,
    Color? iconColor,
    Gradient? gradient,
  }) : super(
          style: ElevatedButton.styleFrom(
            // backgroundColor: backgroundColor,
            shape: const CircleBorder(),
            splashFactory: NoSplash.splashFactory,
            iconColor: iconColor,
            backgroundBuilder: (context, states, child) {
              final active = states.contains(
                    WidgetState.pressed,
                  ) ||
                  states.contains(
                    WidgetState.hovered,
                  );
              return AnimatedScale(
                scale: active ? .9 : 1,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                    gradient: gradient,
                  ),
                  child: child,
                ),
              );
            },
          ),
        );
}

class AppCustomButton extends FilledButton {
  AppCustomButton({
    super.key,
    required super.onPressed,
    required super.child,
    Color? textColor,
  }) : super(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.comfortable,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            backgroundBuilder: (context, states, child) {
              final active = states.contains(
                    WidgetState.pressed,
                  ) ||
                  states.contains(
                    WidgetState.hovered,
                  );
              return AnimatedScale(
                scale: active ? .95 : 1.0,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: child,
              );
            },
          ),
        );
}
