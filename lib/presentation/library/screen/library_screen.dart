import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/widget/app_text.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText.base(
        AppStrings.labelLibrary,
      ),
    );
  }
}
