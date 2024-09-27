import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/colors.dart';
import 'package:tien_am/presentation/main/widget/app_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainScreen({
    super.key,
    required this.shell,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.purpleGradient,
      ),
      child: Scaffold(
        body: shell,
        extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: AppNavBar(
            items:  const [
              BottomNavigationBarItem(
                label: AppStrings.labelExplore,
                icon: Icon(
                  Icons.explore_outlined,
                ),
                activeIcon: Icon(
                  Icons.explore,
                )
              ),
              BottomNavigationBarItem(
                label: AppStrings.labelSearch,
                icon: Icon(
                  OctIcons.search,
                ),
                activeIcon: Icon(
                  OctIcons.search,
                )
              ),
              BottomNavigationBarItem(
                label: AppStrings.labelLibrary,
                icon: Icon(
                  FontAwesome.bookmark,
                ),
                activeIcon: Icon(
                  FontAwesome.bookmark,
                )
              ),
              BottomNavigationBarItem(
                label: AppStrings.labelChallenge,
                icon: Icon(
                  FontAwesome.flag,
                ),
                activeIcon: Icon(
                  FontAwesome.flag,
                )
              ),
            ],
            currentIndex: shell.currentIndex,
            onTap: (index) {
              shell.goBranch(
                index,
                initialLocation: shell.currentIndex == index,
              );
            },
          ),
        ),
      ),
    );
  }
}
