import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tien_am/core/network/queries.dart';
import 'package:tien_am/data/datasource/api/entity/book_category_entity.dart';
import 'package:tien_am/data/datasource/base/book_category_datasource.dart';

import 'book_datasource_test.mocks.dart';

@GenerateMocks([BookCategoryDatasource])
main() {
  group(
    'Test book categories',
    () {
      final query = PaginationQuery();


      test(
        'Test fetch book categories',
        () async {
          final repo = MockBookCategoryDatasource();
          when(repo.getList(query)).thenAnswer(
                (_) async => [],
          );

          final categories = await repo.getList(query);

          expect(categories.length, 0);
          verify(repo.getList(query));
          verifyNoMoreInteractions(repo);
        },
      );
    },
  );
}
