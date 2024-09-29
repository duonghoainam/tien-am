import 'dart:math';

import 'package:tien_am/domain/model/book_model.dart';
import 'package:tien_am/domain/repository/book_repository.dart';

class ExampleSearchBookRepository implements BookRepository {
  ExampleSearchBookRepository();

  final _books = List.generate(
    100,
    (index) {
      return BookModel(
        image: 'https://picsum.photos/id/$index/200/300',
        title: 'Sách thứ $index',
        author: 'Người sói ${index}',
      );
    },
  );

  @override
  Future<List<BookModel>> getList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _books
        .where(
          (element) {
            if (search == null) return true;
            return element.title.contains(search);
          },
        )
        .skip(max((page - 1) * limit, 0))
        .take(limit)
        .toList();
  }
}
