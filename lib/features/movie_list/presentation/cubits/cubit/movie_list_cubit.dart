import 'package:Movies/core/error/failures.dart';
import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:Movies/features/movie_list/domain/usecases/search_movies.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final SearchMovies searchMovies;

  MovieListCubit({this.searchMovies}) : super(MovieListEmpty());

  Future<void> search(String searchPattern) async {
    emit(MovieListSearching());
    final result = await searchMovies(Params(searchPattern: searchPattern));
    result.fold(
      (l) => emit(MovieListSearchError(message: errorMessage(l))),
      (r) => emit(MovieListSearchDone(movies: r)),
    );
  }

  String errorMessage(Failure failure) {
    return "Falha na busca";
  }
}
