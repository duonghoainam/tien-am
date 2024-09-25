import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/widget/app_button.dart';
import 'package:tien_am/core/ui/widget/app_title.dart';
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

          backgroundColor: Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              FlutterLogo(
                size: 30,
              ),
              AppTitle(
                AppStrings.appName,
              ),
            ],
          ),
          actions: [
            const UpgradeButton(),
            AppIconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_2_outlined,
                ))
          ],
        ),
      ],
    );
  }
}
