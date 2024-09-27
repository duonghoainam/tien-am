import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/app_scale_widget.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HomeSectionTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
      onPressed: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.medium(
              title,
              fontSize: FontSizes.large,
              textColor: AppColors.black,
            ),
            if (onTap != null)
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.darkGrey,
                size: 20,
              )
          ],
        ),
      ),
    );
  }
}
