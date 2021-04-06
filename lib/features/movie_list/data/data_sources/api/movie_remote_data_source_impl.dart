import 'package:Movies/core/error/exceptions.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/tmdb_api.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final TmdbApi api;

  MovieRemoteDataSourceImpl(this.api);

  @override
  Future<List<MovieModel>> searchMovies(String searchPattern) async {
    final result = await api.searchMovie(searchPattern);
    final statusCode = result.response.statusCode;
    
    if (statusCode >= 200 && statusCode < 300) {
      return result.data.results.map((e) => e.toModel()).toList();
    } else {
      throw ServerException(statusCode: statusCode);
    }
  }
}
