import 'package:equatable/equatable.dart';

abstract class BaseQuery {
  const BaseQuery();

  Map<String, dynamic> toMap();
}

class PaginationQuery extends BaseQuery with EquatableMixin {
  final int page;
  final int limit;

  const PaginationQuery({
    this.page = 1,
    this.limit = 10,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'size': limit,
    };
  }

  @override
  List<Object?> get props => [
        page,
        limit,
      ];
}

class PaginationWithSearchQuery extends PaginationQuery {
  final String search;

  PaginationWithSearchQuery({
    this.search = '',
    super.limit,
    super.page,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (search.isNotEmpty) 'search': search,
      ...super.toMap(),
    };
  }
}
