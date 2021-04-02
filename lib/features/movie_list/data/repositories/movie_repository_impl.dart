import 'package:Movies/core/error/exceptions.dart';
import 'package:Movies/core/network/network_info.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String searchPattern) async {
    final connected = await networkInfo.isConnected;
    if (connected) {
      try {
        final result = await remoteDataSource.searchMovies(searchPattern);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
