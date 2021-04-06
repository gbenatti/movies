import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popularidade: ${movie.popularity}",
          style: const TextStyle(fontSize: 16),
        ),
        vSpacing(8),
        Text(
          "Data de lançamento: ${formatDate(movie.releaseDate)}",
          style: const TextStyle(fontSize: 16),
        ),
        vSpacing(8),
        Text(
          "Média de votos: ${movie.voteAverage}",
          style: const TextStyle(fontSize: 16),
        ),
        vSpacing(8),
        const Text(
          "Duração: ",
          style: TextStyle(fontSize: 16),
        ),
        vSpacing(16),
        Text(
          movie.overview,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget vSpacing(double spacing) => SizedBox(height: spacing);

  String formatDate(DateTime dateTime) =>
      "${dateTime.day}/${dateTime.month}/${dateTime.year}";
}
