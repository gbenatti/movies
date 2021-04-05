import 'package:Movies/core/network/network_info.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/movie_remote_data_source_impl.dart';
import 'package:Movies/features/movie_list/data/data_sources/api/tmdb_api.dart';
import 'package:Movies/features/movie_list/data/data_sources/movie_remote_data_source.dart';
import 'package:Movies/features/movie_list/data/repositories/movie_repository_impl.dart';
import 'package:Movies/features/movie_list/domain/repositories/movie_repository.dart';
import 'package:Movies/features/movie_list/presentation/cubits/cubit/movie_list_cubit.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'features/movie_list/domain/usecases/search_movies.dart';

final sl = GetIt.instance;

void init() {
// Features - MovieList

// Cubits
  sl.registerFactory(() => MovieListCubit(searchMovies: sl()));

// Use cases
  sl.registerLazySingleton(() => SearchMovies(sl()));

// Repositories
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(sl(), sl()));

// Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(sl()));

// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

// External
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<TmdbApi>(() => TmdbApi.client());
}
