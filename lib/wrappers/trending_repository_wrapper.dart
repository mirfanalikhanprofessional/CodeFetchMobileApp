import 'package:code_fetch_mobile_app/services/logger_service.dart';

class TrendingRepositoryListWrapper{

  TrendingRepositoryListWrapper({
    this.totalCounts,
    this.incompleteResults,
    this.trendingListRepositoryListWrapper,
  });

  factory TrendingRepositoryListWrapper.fromJson(Map<String, dynamic> json) {
    return TrendingRepositoryListWrapper(
      totalCounts: json['total_count'],
      incompleteResults: json['incomplete_results'],
      trendingListRepositoryListWrapper: (json['items'] as List<dynamic>).map(
        (element) => TrendingRepositoryWrapper.fromJson(element)
      ).toList(),
    );
  }

  final int? totalCounts;
  final bool? incompleteResults;
  final List<TrendingRepositoryWrapper>? trendingListRepositoryListWrapper;

  Map<String, dynamic> toJson() {
    return {
      'total_count' : totalCounts,
      'incomplete_results' : incompleteResults,
      'items' : (trendingListRepositoryListWrapper ?? [])
        .map((element) => element.toJson()) .toList()
    };
  }
}

class TrendingRepositoryWrapper {

  TrendingRepositoryWrapper({
    this.ownerAvatarUrl,
    this.ownerUsername,
    this.repoName,
    this.description,
    this.language,
    this.starsCount,
  });

  final String? ownerAvatarUrl;
  final String? ownerUsername;
  final String? repoName;
  final String? description;
  final String? language;
  final int? starsCount;

  factory TrendingRepositoryWrapper.fromJson(Map<String, dynamic> json) {
    LoggerService.logs('====OWNER ${json}');
    return TrendingRepositoryWrapper(
      ownerAvatarUrl: json['owner']['avatar_url'] ?? '',
      ownerUsername: json['owner']['url'].split('/')
          .last, // Extracting username from URL
      repoName: json['name'] ?? '',
      description: json['description'],
      language: json['language'],
      starsCount: json['stargazers_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerAvatarUrl': ownerAvatarUrl,
      'ownerUsername': ownerUsername,
      'repoName': repoName,
      'description': description,
      'language': language,
      'starsCount': starsCount,
    };
  }
}
