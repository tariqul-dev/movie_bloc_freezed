import '../../domain/entities/now_showing_movies.dart';

class NowShowingMoviesModel extends NowShowingMovies {
  NowShowingMoviesModel({
    super.dates,
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  NowShowingMoviesModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? DatesModel.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  factory NowShowingMoviesModel.fromObject(
          {required NowShowingMovies nowShowingMovies}) =>
      NowShowingMoviesModel(
        dates: nowShowingMovies.dates,
        page: nowShowingMovies.page,
        results: nowShowingMovies.results,
        totalPages: nowShowingMovies.totalPages,
        totalResults: nowShowingMovies.totalResults,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = DatesModel.fromObject(dates: dates ?? Dates()).toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results
          ?.map((v) => ResultsModel.fromObject(results: v).toJson())
          .toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

class ResultsModel extends Results {
  ResultsModel({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  ResultsModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  factory ResultsModel.fromObject({required Results results}) => ResultsModel(
        adult: results.adult,
        backdropPath: results.backdropPath,
        genreIds: results.genreIds,
        id: results.id,
        originalLanguage: results.originalLanguage,
        originalTitle: results.originalTitle,
        overview: results.overview,
        popularity: results.popularity,
        posterPath: results.posterPath,
        releaseDate: results.releaseDate,
        title: results.title,
        video: results.video,
        voteAverage: results.voteAverage,
        voteCount: results.voteCount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

class DatesModel extends Dates {
  DatesModel({
    super.maximum,
    super.minimum,
  });

  DatesModel.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  factory DatesModel.fromObject({required Dates dates}) => DatesModel(
        maximum: dates.maximum,
        minimum: dates.minimum,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
