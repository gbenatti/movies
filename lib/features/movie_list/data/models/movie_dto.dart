import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  final int id;
  @JsonKey(name: "poster_path")
  final String posterPath;
  final bool adult;
  final String overview;
  @JsonKey(name: "release_date")
  final DateTime releaseDate;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  final String title;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  final double popularity;
  @JsonKey(name: "vote_count")
  final int voteCount;
  final bool video;
  @JsonKey(name: "vote_average")
  final double voteAverage;

  MovieDto({
    this.id,
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

  Movie toEntity() {
    return Movie(
      id: id,
      posterPath: posterPath,
      adult: adult,
      overview: overview,
      releaseDate: releaseDate,
      genreIds: genreIds,
      originalTitle: originalTitle,
      originalLanguage: originalLanguage,
      title: title,
      backdropPath: backdropPath,
      popularity: popularity,
      voteCount: voteCount,
      video: video,
      voteAverage: voteAverage,
    );
  }
}
