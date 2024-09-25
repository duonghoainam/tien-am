import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: 'Nâng cấp',
      titleColor: AppColors.white,
      onPressed: () {
      },
    );
  }
}
