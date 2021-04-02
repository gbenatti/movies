import 'package:Movies/features/movie_list/domain/usecases/search_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.dart';

void main() {
  MockMovieRepository repository;
  SearchMovies usecase;

  setUp(() {
    repository = MockMovieRepository();
    usecase = SearchMovies(repository);
  });

  final firstMovie = MockMovie();
  final secondMovie = MockMovie();
  final movieList = [firstMovie, secondMovie];
  const movieName = "Batman";

  test("should get list of movies from repository", () async {
    // arrange
    when(repository.searchMovies(any))
        .thenAnswer((_) async => Right(movieList));

    // act
    final result = await usecase(const Params(searchPattern: movieName));

    // assert
    expect(result, Right(movieList));
    verify(repository.searchMovies(movieName));
    verifyNoMoreInteractions(repository);
  });
}
