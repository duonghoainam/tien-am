import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/widget/app_text.dart';

class AppTitle extends StatelessWidget {
  final String title;

  const AppTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText.base(
      title,
      fontSize: FontSizes.medium
    );
  }
}
