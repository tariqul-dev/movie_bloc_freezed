import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_bloc_freezed/src/core/usecases/usecase.dart';
import 'package:movie_bloc_freezed/src/features/movie_list/domain/entities/now_showing_movies.dart';
import 'package:movie_bloc_freezed/src/features/movie_list/domain/entities/popular_movies.dart';

import '../../domain/usecases/get_now_showing_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

part 'movie_list_bloc.freezed.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetPopularMovies getPopularMovies;
  final GetNowShowingMovies getNowShowingMovies;

  MovieListBloc({
    required this.getPopularMovies,
    required this.getNowShowingMovies,
  }) : super(MovieListState.initial()) {
    on<MovieListEvent>((event, emit) async {
      await event.map(
        getPopularMovies: (value) async {
          emit(state.copyWith(isLoading: true));
          final response = await getPopularMovies(NoParams());

          await response!.fold(
            (failure) async {
              emit(state.copyWith(
                isLoading: false,
                isFailure: true,
                failedMessage: failure.message,
              ));
            },
            (data) async {
              emit(state.copyWith(
                isLoading: false,
                popularMovies: data,
              ));
            },
          );
        },
        getNowShowingMovies: (value) async {
          emit(state.copyWith(isLoading: true));
          final response = await getNowShowingMovies(NoParams());

          await response!.fold(
            (failure) async {
              emit(state.copyWith(
                isLoading: false,
                isFailure: true,
                failedMessage: failure.message,
              ));
            },
            (data) async {
              emit(state.copyWith(
                isLoading: false,
                nowShowingMovies: data,
              ));
            },
          );
        },
      );
    });
  }
}
