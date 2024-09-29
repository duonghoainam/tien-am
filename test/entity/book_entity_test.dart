import 'package:flutter_test/flutter_test.dart';
import 'package:tien_am/data/datasource/api/entity/book_category_entity.dart';

void main() {
  group(
    'Test parse book category entity map json',
    () {
      late Map<String,dynamic> json;
      setUp(
        () {
          json = {
            '_id': "fjlkdsa",
            'name': 'Hello world',
            'slug': 'Hello world',
            'createdAt': ''
          };
        },
      );

      test(
        'Test success parse',
        () {
          final entity = BookCategoryEntity.fromMap(json);

          expect(entity.id, 'fjlkdsa');
          expect(entity.name, 'Hello world');
          expect(entity.slug, 'Hello world');
          expect(entity.createdAt, null);
          expect(entity.updatedAt, null);
        },
      );
    },
  );
}
