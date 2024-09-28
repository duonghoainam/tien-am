import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/colors.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/app_text.dart';

class BookSearchDelegate<T> extends SearchDelegate<T?> {
  BookSearchDelegate() : super(
    searchFieldLabel: AppStrings.hintSearch,
    searchFieldStyle: AppTextStyles.base(
      fontSize: FontSizes.normal.size,
    ),
  );

  @override
  set query(String value) {
    if (value.length > 2) {
      super.query = value;
    }
  }

  @override
  bool? get automaticallyImplyLeading => false;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget? buildFlexibleSpace(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              .9,
            ]),
      ),
    );
  }

  final _boxDecoration = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    ),
  );

  final _backgroundDecoration = const BoxDecoration(
    gradient: AppColors.purpleGradient,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          close(context, null);
        },
        child: AppText.base(
          AppStrings.titleCancel,
          textColor: AppColors.white,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration,
      child: Container(
        decoration: _boxDecoration,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration,
      child: Container(
        decoration: _boxDecoration,
      ),
    );
  }
}
