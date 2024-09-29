import 'package:tien_am/domain/model/book_model.dart';

abstract interface class BookRepository {
  Future<List<BookModel>> getList({
    int page = 1,
    int limit = 10,
    String? search,
  });
}

abstract interface class BookDetailRepository {
  Future<BookModel> getDetail(String slug);
}
