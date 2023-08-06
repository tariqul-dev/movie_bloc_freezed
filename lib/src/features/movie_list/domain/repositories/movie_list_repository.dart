import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/now_showing_movies.dart';
import '../entities/popular_movies.dart';

abstract class MovieListRepository {
  Future<Either<Failures, NowShowingMovies>> getNowShowingMovies();

  Future<Either<Failures, PopularMovies>> getPopularMovies();
}
