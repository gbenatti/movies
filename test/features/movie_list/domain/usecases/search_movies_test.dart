import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:Movies/features/movie_list/domain/usecases/search_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends Mock implements MovieRepository {}
// ignore: must_be_immutable
class MockMovie extends Mock implements Movie {}

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
  final movieName = "Batman";

  test("should get list of movies from repository", () async {
    when(repository.searchMpvies(any))
        .thenAnswer((_) async => Right(movieList));

    final result = await usecase.execute(SearchMoviesParams(movieName));

    expect(result, Right(movieList));
    verify(repository.searchMpvies(movieName));
    verifyNoMoreInteractions(repository);
  });
}
