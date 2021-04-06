part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListEmpty extends MovieListState {}
class MovieListSearching extends MovieListState {}

class MovieListSearchDone extends MovieListState {
  final List<Movie> movies;

  const MovieListSearchDone({@required this.movies});

  @override
  List<Object> get props => [movies];
}

class MovieListSearchError extends MovieListState {
  final String message;
 
 const MovieListSearchError({@required this.message});

  @override
  List<Object> get props => [message];
}
