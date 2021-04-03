import 'package:Movies/core/network/network_info.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/tmdb_api.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/models/movie_model.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart' show Response;

class MockMovieRepository extends Mock implements MovieRepository {}
// ignore: must_be_immutable, avoid_implementing_value_types
class MockMovie extends Mock implements Movie {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}
// ignore: must_be_immutable, avoid_implementing_value_types
class MockMovieModel extends Mock implements MovieModel {}

class MockApi extends Mock implements TmdbApi {}
class MockHttpResponse<T> extends Mock
    implements HttpResponse<T> {}

class MockResponse extends Mock implements Response<dynamic>{}
