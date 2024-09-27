import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class AppChip extends FilledButton {
  AppChip({
    super.key,
    required super.onPressed,
    required String title,
    bool hasBadge = false,
  }) : super(
          child: AppText.medium(
            title,
            fontSize: FontSizes.normal,
            textColor: AppColors.white,
          ),
          style: FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.compact,
            textStyle: AppTextStyles.base(
              fontSize: FontSizes.normal.size,
              textColor: AppColors.white,
            ),
            backgroundColor: Colors.transparent,
            backgroundBuilder: (context, states, child) {
              final active = states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered);
              return AnimatedScale(
                scale: active ? .95 : 1.0,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          width: .5,
                          color: AppColors.white,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 5,
                      ),
                      child: child,
                    ),
                    if (hasBadge)
                      Positioned(
                        top: -3,
                        right: 2,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const ShapeDecoration(
                            color: Colors.red,
                            shape: CircleBorder(
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        );
}
