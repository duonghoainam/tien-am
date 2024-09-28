
import 'package:tien_am/domain/model/book_category_model.dart';

abstract interface class BookCategoryRepository {
  Future<List<BookCategoryModel>> getList();
}