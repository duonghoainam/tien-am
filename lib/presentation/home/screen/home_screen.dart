import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/app_button.dart';
import 'package:tien_am/core/ui/widget/app_title.dart';
import 'package:tien_am/presentation/home/widget/books_carousel.dart';
import 'package:tien_am/presentation/home/widget/home_book_categories.dart';
import 'package:tien_am/presentation/home/widget/home_books_list.dart';
import 'package:tien_am/presentation/home/widget/home_section_title.dart';
import 'package:tien_am/presentation/main/widget/upgrade_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.blueGrey,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          title: const AppTitle(
            AppStrings.appName,
            titleColor: AppColors.white,
            icon: FlutterLogo(
              size: 30,
            ),
          ),

          actions: [
            const UpgradeButton(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: AppIconButton(
                backgroundColor: AppColors.lightGrey,
                onPressed: () {},
                icon: const Icon(
                  Icons.person_2_outlined,
                ),
              ),
            )
          ],
        ),
        SliverList.list(
          children: [
            const HomeBookCategories(),
            const BooksCarousel(),
            HomeSectionTitle(
              title: AppStrings.titleFreeBook,
              onTap: () {},
            ),
            const HomeBooksList(),
            HomeSectionTitle(
              title: AppStrings.titleContinue,
              onTap: () {},
            ),
            const SizedBox(
              height: 100,
            )
          ],
        )
      ],
    );
  }
}
