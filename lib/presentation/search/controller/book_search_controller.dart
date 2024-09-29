import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:tien_am/data/repository/search_book_repository.dart';
import 'package:tien_am/domain/model/book_model.dart';
import 'package:tien_am/domain/repository/book_repository.dart';

class BookSearchController extends PagedNotifier<int, BookModel> {
  final BookRepository repository;

  BookSearchController(
    this.repository,
    String search,
  ) : super(
          load: (page, limit) => repository.getList(
            page: page,
            limit: limit,
            search: search,
          ),
          nextPageKeyBuilder: (lastItems, page, limit) {
            return (lastItems == null || lastItems.length < limit)
                ? null
                : (page + 1);
          },
        );
}

final booksProvider = StateNotifierProvider.family<BookSearchController,
    PagedState<int, BookModel>, String>(
  (ref, arg) {
    return BookSearchController(
      ExampleSearchBookRepository(),
      arg,
    );
  },
);
