import 'package:code_fetch_mobile_app/repositories/trending_repositories_repository.dart';
import 'package:code_fetch_mobile_app/wrappers/trending_repository_query.dart';
import 'package:code_fetch_mobile_app/wrappers/trending_repository_wrapper.dart';

class TrendingRepositoryUseCase {
  TrendingRepositoryUseCase(this._trendingRepositoriesRepository);

  final TrendingRepositoriesRepository _trendingRepositoriesRepository;

  Future<TrendingRepositoryListWrapper?> getTrendingRepositories(
    String query, {
      String sort = 'stars',
      String order = 'desc',
      int page = 1,
      int perPage = 10,
    }) async {
    final trendingRepositoryQuery = TrendingRepositoryQuery(
      query: query,
      sort: sort,
      order: order,
      page: page,
      perPage: perPage
    );
    final trendingRepositories = await _trendingRepositoriesRepository.getTrendingRepositories(
      trendingRepositoryQuery,
    );
    return trendingRepositories;
  }


}