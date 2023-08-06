import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/now_showing_movies.dart';
import '../../domain/entities/popular_movies.dart';
import '../../domain/repositories/movie_list_repository.dart';
import '../datasources/movie_list_remote_data_source.dart';

class MovieListRepositoryImpl implements MovieListRepository {
  final MovieListRemoteDataSource movieListRemoteDataSource;

  MovieListRepositoryImpl({required this.movieListRemoteDataSource});

  @override
  Future<Either<Failures, NowShowingMovies>> getNowShowingMovies() async {
    return await BodyCall<NowShowingMovies>()(
      () => movieListRemoteDataSource.getNowShowingMovies(),
    );
  }

  @override
  Future<Either<Failures, PopularMovies>> getPopularMovies() async =>
      await BodyCall<PopularMovies>()(
        () => movieListRemoteDataSource.getPopularMovies(),
      );
}

class BodyCall<Type> {
  Future<Either<Failures, Type>> call(Future<Type> Function() callable) async {
    try {
      final remoteData = await callable();
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
