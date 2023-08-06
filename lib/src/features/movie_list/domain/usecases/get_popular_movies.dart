import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/popular_movies.dart';
import '../repositories/movie_list_repository.dart';

class GetPopularMovies implements UseCase<PopularMovies, NoParams> {
  final MovieListRepository repository;

  GetPopularMovies({required this.repository});

  @override
  Future<Either<Failures, PopularMovies>?> call(NoParams params) {
    return repository.getPopularMovies();
  }
}
