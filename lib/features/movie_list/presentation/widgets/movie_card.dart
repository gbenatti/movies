import 'package:Movies/features/movie_list/domain/entities/movie.dart';
import 'package:flutter/material.dart';

const _posterPathUrl = "https://image.tmdb.org/t/p/w500";
const _aspectRatio = 1.77;

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.movie,
    @required this.onDetails,
  }) : super(key: key);

  final Movie movie;
  final void Function() onDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
            child: Text(
              movie.title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Text("${movie.popularity} popularidade"),
          ),
          AspectRatio(
            aspectRatio: _aspectRatio,
            child: Image.network(
              _posterPathUrl + movie.posterPath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: onDetails,
                textColor: Theme.of(context).accentColor,
                child: const Text("DETALHES"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
