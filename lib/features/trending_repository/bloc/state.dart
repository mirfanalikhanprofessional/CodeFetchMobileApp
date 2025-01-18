part of 'bloc.dart';

sealed class TrendingRepositoryState {}

final class TrendingRepositoryInitialState extends TrendingRepositoryState {}

final class TrendingRepositoryLoadingState extends TrendingRepositoryState {}

final class TrendingRepositoryLoadedState extends TrendingRepositoryState {}

final class TrendingRepositoryErrorState extends TrendingRepositoryState {
  TrendingRepositoryErrorState(this.error);
  final String error;
}

