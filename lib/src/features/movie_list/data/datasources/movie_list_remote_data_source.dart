import 'dart:convert';

import 'package:http/http.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/now_showing_movies_model.dart';
import '../models/popular_movies_model.dart';

abstract class MovieListRemoteDataSource {
  /// Calling API: https://api.themoviedb.org/3/movie/now_playing?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1
  /// return [NowShowingMoviesModel]
  /// Throws [ServerException]
  Future<NowShowingMoviesModel> getNowShowingMovies();

  /// Calling API: https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1
  /// return [PopularMoviesModel]
  /// Throws [ServerException]
  Future<PopularMoviesModel> getPopularMovies();
}

class MovieListRemoteDataSourceImpl implements MovieListRemoteDataSource {
  final Client client;

  MovieListRemoteDataSourceImpl({required this.client});

  @override
  Future<NowShowingMoviesModel> getNowShowingMovies() async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NowShowingMoviesModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          message: '${response.statusCode}: ${response.reasonPhrase}');
    }
  }

  @override
  Future<PopularMoviesModel> getPopularMovies() async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=3479c5fe9ddcf97176adc7bba656c7b5&language=en-US&page=1',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PopularMoviesModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          message: '${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
