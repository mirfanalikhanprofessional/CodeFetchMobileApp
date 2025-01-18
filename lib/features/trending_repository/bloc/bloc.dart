import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/string_constants.dart';
import '../../../services/logger_service.dart';
import '../../../use_case/trending_repository_use_case.dart';
import '../../../wrappers/trending_repository_wrapper.dart';

part './event.dart';
part './state.dart';



class TrendingRepositoryBloc extends Bloc<TrendingRepositoryEvent, TrendingRepositoryState> {

  TrendingRepositoryBloc(
    this._trendingRepositoryUseCase,
  ) : super(
    TrendingRepositoryInitialState()
  ) {
    on<SearchForTrendingRepository>(_onSearchingTrendingRepository);
  }

  final TrendingRepositoryUseCase _trendingRepositoryUseCase;

  TrendingRepositoryListWrapper? _trendingRepositoryListWrapper;
  TrendingRepositoryListWrapper? get trendingRepositoryListWrapper =>
    _trendingRepositoryListWrapper;

  Future<void> _onSearchingTrendingRepository(
      SearchForTrendingRepository event,
      Emitter<TrendingRepositoryState> emit,
      ) async {
    try {
      emit(TrendingRepositoryLoadingState());

      final response = await _trendingRepositoryUseCase.getTrendingRepositories(
        event.query,
        sort: event.sort,
        order: event.order,
        page: event.page,
        perPage: event.perPage,
      );
      final totalCounts = response?.totalCounts ?? 0;
      if (response != null && totalCounts > 0) {
        _trendingRepositoryListWrapper = response;
        emit(
          TrendingRepositoryLoadedState()
        );
      } else {
        emit(
          TrendingRepositoryErrorState(
            StringConstants.errorNoRepositoriesFound,
          ),
        );
      }
    } catch (error, trace) {
      LoggerService.logs(error);
      LoggerService.logs(trace);
      emit(TrendingRepositoryErrorState(StringConstants.errorNoRepositoriesFound));
    }
  }


}
