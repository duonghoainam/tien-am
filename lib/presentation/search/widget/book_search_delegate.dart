import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/helpers/debouncer.dart';
import 'package:tien_am/core/ui/styles/colors.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/app_text.dart';

import '../controller/book_search_controller.dart';

class BookSearchDelegate<T> extends SearchDelegate<T?> {
  BookSearchDelegate()
      : super(
          searchFieldLabel: AppStrings.hintSearch,
          searchFieldStyle: AppTextStyles.base(
            fontSize: FontSizes.normal.size,
          ),
        );

  final _debounce = Debounce();

  // @override
  // set query(String value) {
  //   if (value.length > 2) {
  //     _debounce.run(
  //       () {
  //         super.query = value;
  //       },
  //     );
  //   } else {
  //     super.query = '';
  //   }
  // }

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
    color: AppColors.lightBlue,
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
      clipBehavior: Clip.hardEdge,
      decoration: _backgroundDecoration,
      child: Container(
        decoration: _boxDecoration,
        child: _BookSearchView(
          search: query,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration,
      child: Container(
        decoration: _boxDecoration,
        child: const _BookSearchView(
          search: '',
        ),
      ),
    );
  }
}

class _BookSearchView extends ConsumerWidget {
  final String search;

  const _BookSearchView({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context, ref) {
    return RiverPagedBuilder(
      provider: booksProvider(search),
      pagedBuilder: (controller, builder) {
        return PagedListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          builderDelegate: builder,
          pagingController: controller,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      },
      itemBuilder: (context, item, index) => Row(
        children: [
          Container(
            width: 80,
            height: 150,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  item.image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              AppText.bold(
                item.title,
              ),
              AppText.base(
                item.author,
                textColor: AppColors.lightGrey,
                fontSize: FontSizes.small,
              ),
            ],
          )
        ],
      ),
      firstPageKey: 1,
      limit: 5,
    );
  }
}
