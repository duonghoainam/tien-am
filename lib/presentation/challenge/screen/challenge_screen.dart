import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText.base(
        AppStrings.labelChallenge,
      ),
    );
  }
}
