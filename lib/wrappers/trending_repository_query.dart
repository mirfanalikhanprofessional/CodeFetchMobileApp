class TrendingRepositoryQuery {
  final String? query;
  final String? sort;
  final String? order;
  final int? page;
  final int? perPage;

  TrendingRepositoryQuery({
    this.query,
    this.sort,
    this.order,
    this.page,
    this.perPage,
  });

  // Factory method to create a model from a Map (if needed)
  factory TrendingRepositoryQuery.fromMap(Map<String, dynamic> map) {
    return TrendingRepositoryQuery(
      query: map['q'] ?? '',
      sort: map['sort'] ?? 'stars',
      order: map['order'] ?? 'desc',
      page: int.tryParse(map['page']?.toString() ?? '1') ?? 1,
      perPage: int.tryParse(map['per_page']?.toString() ?? '10') ?? 10,
    );
  }

  // Convert the model back to a Map (if needed for serialization)
  Map<String, String> toMap() {
    return {
      'q': query ?? '',
      'sort': sort ?? '',
      'order': order ?? '',
      'page': page.toString(),
      'per_page': perPage.toString(),
    };
  }
}
