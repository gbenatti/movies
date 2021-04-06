import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'movie_info_widget.dart';

const _imagePathUrl = "https://image.tmdb.org/t/p/w300";

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({Key key, @required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            _imagePathUrl + movie.posterPath,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: MovieInfoWidget(movie: movie),
          ),
        ],
      ),
    );
  }
}

