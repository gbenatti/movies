import 'package:Movies/core/error/exceptions.dart';
import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/data/repositories/movie_repository_impl.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.dart';

void main() {
  MockMovieRemoteDataSource remoteDataSource;
  MockNetworkInfo networkInfo;
  MovieRepository repository;

  setUp(() {
    remoteDataSource = MockMovieRemoteDataSource();
    networkInfo = MockNetworkInfo();
    repository = MovieRepositoryImpl(remoteDataSource, networkInfo);
  });

  final firstMovie = MockMovieModel();
  final secondMovie = MockMovieModel();
  final movieModelList = [firstMovie, secondMovie];
  const query = "batman";

  group("when connection is on", () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
    });

    test("should return list of movies from data source", () async {
      // arrange
      when(remoteDataSource.searchMovies(any))
          .thenAnswer((_) async => movieModelList);

      // act
      final result = await repository.searchMovies(query);

      // assert
      expect(result, Right(movieModelList));
      verify(networkInfo.isConnected);
      verify(remoteDataSource.searchMovies(query));
      verifyNoMoreInteractions(remoteDataSource);
      verifyNoMoreInteractions(networkInfo);
    });

    test("should return ServerFailure when data source throws a ServerException", () async {
      // arrange
      when(remoteDataSource.searchMovies(any)).thenThrow(ServerException());

      // act
      final result = await repository.searchMovies(query);

      // assert
      expect(result, Left(ServerFailure()));
      verify(networkInfo.isConnected);
      verify(remoteDataSource.searchMovies(query));
      verifyNoMoreInteractions(networkInfo);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
  
  group("when connection is off", () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
    });

    test("should return NoConnectionFailure", () async {
      // arrange
      when(remoteDataSource.searchMovies(any))
          .thenAnswer((_) async => movieModelList);

      // act
      final result = await repository.searchMovies(query);

      // assert
      expect(result, Left(NoConnectionFailure()));
      verify(networkInfo.isConnected);
      verifyNever(remoteDataSource.searchMovies(query));
      verifyNoMoreInteractions(networkInfo);
    });
  });
}
