import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/widget/app_text.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Color? titleColor;

  const AppTitle(
    this.title, {
    super.key,
    this.icon,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = AppText.base(
      title,
      fontSize: FontSizes.medium,
      textColor: titleColor,
    );
    if (icon != null) {
      return Row(
        children: [
          icon!,
          Flexible(
            child: titleWidget,
          ),
        ],
      );
    }
    return titleWidget;
  }
}
