import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/helpers/unfocus.dart';
import 'package:tien_am/core/ui/widget/widget.dart';
import 'package:tien_am/presentation/search/widget/book_search_delegate.dart';

class BookSearchBar extends ConsumerWidget {
  final bool forNavigation;

  const BookSearchBar({
    super.key,
    this.forNavigation = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onTap: forNavigation
          ? () => showSearch(
                context: context,
                useRootNavigator: true,
                delegate: BookSearchDelegate(),
              )
          : null,
      focusNode: forNavigation ? AlwaysDisabledFocusNode() : null,
      decoration: InputDecoration(
        label: AppText.base(
          AppStrings.hintSearch,
        ),
        prefixIcon: const Icon(
          OctIcons.search,
        ),
      ),
    );
  }
}
