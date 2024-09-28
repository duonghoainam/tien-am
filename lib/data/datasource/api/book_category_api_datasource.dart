import 'package:tien_am/core/network/network.dart';
import 'package:tien_am/core/network/queries.dart';
import 'package:tien_am/data/datasource/api/entity/book_category_entity.dart';
import 'package:tien_am/data/datasource/base/book_category_datasource.dart';

class BookCategoryApiDatasource implements BookCategoryDatasource {
  final DioProvider api;

  BookCategoryApiDatasource(
    this.api,
  );

  @override
  Future<List<BookCategoryEntity>> getList(BaseQuery query) async {
    final res = await api.get(
      '/book-categories',
      query: query.toMap(),
    );
    return res.when(
      (res) {
        final data = (res.data as List).map<BookCategoryEntity>(
          (e) => BookCategoryEntity.fromMap(e),
        );
        return Future.value(data);
      },
      (res) {
        return Future.error(res.message);
      },
    );
  }
}
