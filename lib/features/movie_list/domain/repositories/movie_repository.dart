import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> searchMpvies(String searchPattern);
}