import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String searchPattern) {
    throw UnimplementedError();
  }
}
