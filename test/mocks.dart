import 'package:Movies/core/network/network_info.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/models/movie_model.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends Mock implements MovieRepository {}
// ignore: must_be_immutable, avoid_implementing_value_types
class MockMovie extends Mock implements Movie {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}
// ignore: must_be_immutable, avoid_implementing_value_types
class MockMovieModel extends Mock implements MovieModel {}
