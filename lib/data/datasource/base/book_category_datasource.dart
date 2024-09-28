import 'package:tien_am/core/network/queries.dart';
import 'package:tien_am/data/datasource/api/entity/book_category_entity.dart';

abstract interface class BookCategoryDatasource {
  Future<List<BookCategoryEntity>> getList(
    BaseQuery query,
  );
}
