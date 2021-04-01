import 'package:Movies/core/domain/usecase.dart';
import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SearchMovies extends UseCase<List<Movie>, Params> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return repository.searchMovies(params.searchPattern);
  }
}

class Params extends Equatable {
  final String searchPattern;

  const Params({@required this.searchPattern});

  @override
  List<Object> get props => [searchPattern];
}