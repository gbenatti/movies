import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import 'movie_card.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onDetails;

  const MovieListWidget({
    Key key,
    this.movies,
    this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        child: MovieCard(
          movie: movies[index],
          onDetails: onDetails != null ? () => onDetails(movies[index]) : null,
        ),
      ),
    );
  }
}
