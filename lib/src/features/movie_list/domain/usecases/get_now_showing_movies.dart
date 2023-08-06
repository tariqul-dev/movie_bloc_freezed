import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/now_showing_movies.dart';
import '../repositories/movie_list_repository.dart';

class GetNowShowingMovies implements UseCase<NowShowingMovies, NoParams> {
  final MovieListRepository repository;

  GetNowShowingMovies({required this.repository});

  @override
  Future<Either<Failures, NowShowingMovies>?> call(NoParams params) {
    return repository.getNowShowingMovies();
  }
}
