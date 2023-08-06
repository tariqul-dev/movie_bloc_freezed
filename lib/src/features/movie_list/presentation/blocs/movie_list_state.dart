part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState({
    PopularMovies? popularMovies,
    NowShowingMovies? nowShowingMovies,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isFailure,
    String? failedMessage,
}) = _MovieListState;

  factory MovieListState.initial() => const MovieListState(
    popularMovies: null,
    nowShowingMovies: null,
    isLoading: false,
    isLoadingMore: false,
    isFailure: false,
    failedMessage: null,
  );
}
