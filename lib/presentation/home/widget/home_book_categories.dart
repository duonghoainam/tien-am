import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class HomeBookCategories extends StatelessWidget {
  const HomeBookCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppChip(
            onPressed: () {},
            title: AppStrings.placeHolder,
          ),
          AppChip(
            onPressed: () {},
            title: AppStrings.placeHolder,
          )
        ],
      ),
    );
  }
}
