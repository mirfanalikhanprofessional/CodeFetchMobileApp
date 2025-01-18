
part of './bloc.dart';

sealed class TrendingRepositoryEvent {}

final class SearchForTrendingRepository extends TrendingRepositoryEvent{
  final String query;
  final String sort;
  final String order;
  final int page;
  final int perPage;

  SearchForTrendingRepository({
    required this.query,
    this.sort = 'stars',
    this.order = 'desc',
    this.page = 1,
    this.perPage = 10,
  });
}