import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class HomeBookCategories extends StatelessWidget {
  const HomeBookCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          AppChip(
            onPressed: () {},
            title: AppStrings.placeHolder,
          )
        ],
      ),
    );
  }
}
