import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final List<int> genreIds;
  final double popularity;
  final int voteCount;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final String originalTitle;
  final String originalLanguage;
  final bool adult;
  final bool video;

  const Movie({
    @required this.id,
    @required this.title,
    @required this.overview,
    @required this.releaseDate,
    @required this.genreIds,
    @required this.popularity,
    @required this.voteCount,
    @required this.voteAverage,
    @required this.posterPath,
    @required this.backdropPath,
    this.originalTitle,
    this.originalLanguage,
    this.adult,
    this.video,
  });

  @override
  List<Object> get props => [
        id,
        title,
        overview,
        releaseDate,
        genreIds,
        popularity,
        voteCount,
        voteAverage,
        posterPath,
        backdropPath,
        originalTitle,
        originalLanguage,
        adult,
        video,
      ];
}
