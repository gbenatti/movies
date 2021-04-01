import 'package:json_annotation/json_annotation.dart';

import 'movie_dto.dart';

part 'search_movie_result_dto.g.dart';

@JsonSerializable()
class SearchMovieResultDto {
  final int page;
  final List<MovieDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  SearchMovieResultDto({this.page, this.results, this.totalPages, this.totalResults});

  factory SearchMovieResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SearchMovieResultDtoToJson(this);
}
