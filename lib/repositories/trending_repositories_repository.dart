import 'package:code_fetch_mobile_app/constants/http_constants.dart';
import 'package:code_fetch_mobile_app/constants/repository_constants.dart';
import 'package:code_fetch_mobile_app/repositories/base_repository.dart';
import 'package:code_fetch_mobile_app/services/network_service.dart';
import 'package:code_fetch_mobile_app/wrappers/trending_repository_query.dart';
import 'package:code_fetch_mobile_app/wrappers/trending_repository_wrapper.dart';

class TrendingRepositoriesRepository extends BaseRepository {
  final _networkService = NetworkService();

  Future<TrendingRepositoryListWrapper?> getTrendingRepositories (
    TrendingRepositoryQuery trendingRepositoryQuery,
  ) async {
    return await performAPICall(
      () async {
        // Perform the API call
        final response = await _networkService.httpGetRequestWithQueryStrings(
          HttpConstants.searchRepositories,
          trendingRepositoryQuery.toMap(),
        );

        // Convert the response into the required wrapper
        return TrendingRepositoryListWrapper.fromJson(response.data);
      },
      RepositoryConstants.trendingRepositories,
    );
  }
}
