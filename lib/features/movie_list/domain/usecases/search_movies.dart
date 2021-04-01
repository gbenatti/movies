import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(SearchMoviesParams params) async {
    return Left(null);
  }
  
}

class SearchMoviesParams {
  final String searchPattern;

  SearchMoviesParams(this.searchPattern);
}