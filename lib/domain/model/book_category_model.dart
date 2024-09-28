
import 'package:equatable/equatable.dart';

class BookCategoryModel extends Equatable {
  final String name;
  final String id;
  final String slug;

  const BookCategoryModel({
    required this.name,
    required this.id,
    required this.slug,
  });


  @override
  List<Object?> get props => throw UnimplementedError();
}
