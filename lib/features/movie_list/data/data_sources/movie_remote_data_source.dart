import 'package:Movies/features/movie_list/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String searchPattern);
}