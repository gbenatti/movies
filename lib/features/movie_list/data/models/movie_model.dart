import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/foundation.dart';

class MovieModel extends Movie {
  const MovieModel({
    @required int id,
    @required String title,
    @required String overview,
    @required DateTime releaseDate,
    @required List<int> genreIds,
    @required double popularity,
    @required int voteCount,
    @required double voteAverage,
    @required String posterPath,
    @required String backdropPath,
    String originalTitle,
    String originalLanguage,
    bool adult,
    bool video,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          popularity: popularity,
          voteCount: voteCount,
          voteAverage: voteAverage,
          posterPath: posterPath,
          backdropPath: backdropPath,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          adult: adult,
          video: video,
        );
}
