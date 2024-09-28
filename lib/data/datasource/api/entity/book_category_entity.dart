class BookCategoryEntity {
  final String name;
  final String id;
  final String slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BookCategoryEntity({
    required this.name,
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookCategoryEntity.fromMap(Map<String, dynamic> map) {
    return BookCategoryEntity(
      name: map['name'] ?? '',
      id: map['_id'] ?? '',
      slug: map['slug'] ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? ''),
    );
  }

}
