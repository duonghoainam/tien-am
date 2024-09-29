import 'package:flutter/material.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/app_button.dart';
import 'package:tien_am/core/ui/widget/app_scale_widget.dart';
import 'package:tien_am/core/ui/widget/widget.dart';
import 'package:tien_am/presentation/main/widget/app_bar.dart';
import 'package:tien_am/presentation/search/widget/book_search_bar.dart';
import 'package:tien_am/presentation/search/widget/book_type_suggestion.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const GeneralAppBar(
            pinned: false,
            title: AppStrings.labelSearch,
            showBlur: false,
            bottom: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: BookSearchBar(
                forNavigation: true,
              ),
            ),
          ),
        ];
      },
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    child: BookTypeSuggestion(
                      title: 'Sách nói',
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: BookTypeSuggestion(
                      title: 'Podcast',
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: BookTypeSuggestion(
                      title: 'TV show',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
