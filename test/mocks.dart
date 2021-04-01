import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends Mock implements MovieRepository {}
// ignore: must_be_immutable, avoid_implementing_value_types
class MockMovie extends Mock implements Movie {}
