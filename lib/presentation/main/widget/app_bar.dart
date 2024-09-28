import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';
import 'package:tien_am/presentation/main/widget/upgrade_button.dart';

class GeneralAppBar extends StatelessWidget {
  final Widget? bottom;
  final bool showLogo;
  final String title;
  final bool showBlur;

  const GeneralAppBar({
    super.key,
    this.bottom,
    this.showLogo = false,
    this.showBlur = true,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.blueGrey,
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: bottom!,
            ),
      flexibleSpace: showBlur
          ? ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            )
          : null,
      title: AppTitle(
        title,
        titleColor: AppColors.white,
        titleSize: showLogo ? FontSizes.medium : FontSizes.large,
        icon: showLogo
            ? const FlutterLogo(
                size: 30,
              )
            : null,
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
    );
  }
}
