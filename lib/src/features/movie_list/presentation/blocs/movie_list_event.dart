part of 'movie_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  const factory MovieListEvent.getPopularMovies() = _GetPopularMovies;
  const factory MovieListEvent.getNowShowingMovies() = _GetNowShowingMovies;
}
