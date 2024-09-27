import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class HomeBooksList extends StatelessWidget {
  const HomeBooksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.maxFinite,
      child: GridView.builder(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return AppCustomButton(
            onPressed: () {

            },
            child: Container(
              clipBehavior: Clip.none,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/id/$index/200/300',
                    ),
                    fit: BoxFit.cover,
                  )),
              alignment: const Alignment(
                0,
                1.1,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: AppText.base(
                  AppStrings.labelFree,
                  fontSize: FontSizes.small,
                  textColor: AppColors.green
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 30,
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
        ),
      ),
    );
  }
}
