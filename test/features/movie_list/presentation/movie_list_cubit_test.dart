import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/usecases/search_movies.dart';
import 'package:Movies/features/movie_list/presentation/cubits/cubit/movie_list_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.dart';

class MockSearchMovies extends Mock implements SearchMovies {}

void main() {
  MockSearchMovies searchMovies;

  test("initialState should be empty", () async {
    final searchMovies = MockSearchMovies();
    final cubit = MovieListCubit(searchMovies: searchMovies);
    expect(cubit.state, MovieListEmpty());
  });

  final movies = [MockMovie(), MockMovie()];
  const query = "batman";

  group("-", () {
    blocTest<MovieListCubit, MovieListState>(
      "should emit searching and done when a valid search is run",
      build: () {
        searchMovies = MockSearchMovies();
        when(searchMovies.call(any)).thenAnswer((_) async => Right(movies));
        return MovieListCubit(searchMovies: searchMovies);
      },
      act: (c) => c.search(query),
      expect: <MovieListState>[
        MovieListSearching(),
        MovieListSearchDone(movies: movies),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      "should emit searching and error when a search has some problem",
      build: () {
        searchMovies = MockSearchMovies();
        when(searchMovies.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return MovieListCubit(searchMovies: searchMovies);
      },
      act: (c) => c.search(query),
      expect: <MovieListState>[
        MovieListSearching(),
        const MovieListSearchError(message: "Falha na busca"),
      ],
    );
  });
}
