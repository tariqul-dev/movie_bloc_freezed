import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'src/features/movie_list/data/datasources/movie_list_remote_data_source.dart';
import 'src/features/movie_list/data/repositories/movie_list_repository_impl.dart';
import 'src/features/movie_list/domain/repositories/movie_list_repository.dart';
import 'src/features/movie_list/domain/usecases/get_now_showing_movies.dart';
import 'src/features/movie_list/domain/usecases/get_popular_movies.dart';
import 'src/features/movie_list/presentation/blocs/movie_list_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(
    () => MovieListBloc(getPopularMovies: sl(), getNowShowingMovies: sl()),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetPopularMovies(repository: sl()),
  );

  sl.registerLazySingleton(
    () => GetNowShowingMovies(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<MovieListRepository>(
    () => MovieListRepositoryImpl(movieListRemoteDataSource: sl()),
  );

  // Datasources
  sl.registerLazySingleton<MovieListRemoteDataSource>(
    () => MovieListRemoteDataSourceImpl(client: sl()),
  );

  // Core

  // Externals
  sl.registerLazySingleton(() => http.Client());
}
