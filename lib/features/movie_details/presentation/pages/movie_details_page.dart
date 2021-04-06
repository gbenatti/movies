import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import '../widgets/movie_details_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: MovieDetailsWidget(movie: movie),
      backgroundColor: Colors.white,
    );
  }
}

