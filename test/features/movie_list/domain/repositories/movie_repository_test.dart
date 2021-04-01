import 'package:Movies/core/network/network_info.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/repositories/movie_repository_impl.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}
class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  MockMovieRemoteDataSource remoteDataSource;
  MovieRepository repository;

  setUp(() {
    remoteDataSource = MockMovieRemoteDataSource();
    remoteDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(remoteDataSource);
  });

  test("", () async {

  });
}
