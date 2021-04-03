import 'package:Movies/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Movies/features/movie_list/data/data_sources/api/movie_dto.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/movie_remote_data_source_impl.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/search_movie_result_dto.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/models/movie_model.dart';

import '../../../../mocks.dart';

void main() {
  MockApi api;
  MockHttpResponse<SearchMovieResultDto> httpResponse;
  MockResponse response;
  MovieRemoteDataSource dataSource;

  setUp(() {
    api = MockApi();
    httpResponse = MockHttpResponse();
    response = MockResponse();
    dataSource = MovieRemoteDataSourceImpl(api);
  });

  final now = DateTime.now();
  final movieDtos = [
    MovieDto(
      id: 1,
      title: "Batman Begins",
      overview: "",
      releaseDate: now,
      genreIds: const [1, 2],
      popularity: 100,
      voteCount: 5,
      voteAverage: 9.5,
      posterPath: "poster",
      backdropPath: "backdrop",
    )
  ];
  final movieModels = [
    MovieModel(
      id: 1,
      title: "Batman Begins",
      overview: "",
      releaseDate: now,
      genreIds: const [1, 2],
      popularity: 100,
      voteCount: 5,
      voteAverage: 9.5,
      posterPath: "poster",
      backdropPath: "backdrop",
    )
  ];
  const query = "batman";
  final searchResult = SearchMovieResultDto(
      page: 1, results: movieDtos, totalPages: 1, totalResults: 1);

  test("should load data from api and convert from dto to model", () async {
    // arrange
    when(response.statusCode).thenReturn(200);
    when(httpResponse.response).thenReturn(response);
    when(httpResponse.data).thenReturn(searchResult);
    when(api.searchMovie(any)).thenAnswer((_) async => httpResponse);

    // act
    final result = await dataSource.searchMovies(query);

    // assert
    expect(result, movieModels);
    verify(api.searchMovie(query));
    verifyNoMoreInteractions(api);
  });

  test("should throw ServerException when statusCode >=300", () async {
    // arrange
    when(response.statusCode).thenReturn(300);
    when(httpResponse.response).thenReturn(response);
    when(httpResponse.data).thenReturn(searchResult);
    when(api.searchMovie(any)).thenAnswer((_) async => httpResponse);

    // act
    final call = dataSource.searchMovies;

    // assert
    expect(() => call(query), throwsA(isA<ServerException>()));
    verify(api.searchMovie(query));
    verifyNoMoreInteractions(api);
  });
}
