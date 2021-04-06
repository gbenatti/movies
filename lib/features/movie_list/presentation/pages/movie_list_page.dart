import 'package:Movies/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:Movies/features/movie_list/presentation/cubits/movie_list_cubit.dart';
import 'package:Movies/features/movie_list/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

import '../../../../dependency_injection.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieListCubit>(),
      child: const MovieListSearchPage(),
    );
  }
}

class MovieListSearchPage extends StatefulWidget {
  const MovieListSearchPage({Key key}) : super(key: key);

  @override
  _MovieListSearchPageState createState() => _MovieListSearchPageState();
}

class _MovieListSearchPageState extends State<MovieListSearchPage> {
  SearchBar searchBar;

  @override
  void initState() {
    searchBar = SearchBar(
      inBar: false,
      buildDefaultAppBar: _buildAppBar,
      setState: setState,
      onSubmitted: _submit,
    );
    super.initState();
  }

  void _submit(String term) {
    final movieList = context.read<MovieListCubit>();
    movieList.search(term);
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Filmes"),
      actions: [
        searchBar.getSearchAction(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<MovieListCubit, MovieListState>(
      listener: (context, state) => _handlePossibleError(state, context),
      builder: (context, state) => _buildContent(state),
    );
  }

  void _handlePossibleError(MovieListState state, BuildContext context) {
    if (state is MovieListSearchError) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget _buildContent(MovieListState state) {
    if (state is MovieListEmpty) {
      return const DisplayMessage(
        message: "Nenhum resultado",
        description: "Tente fazer uma busca.",
      );
    } else if (state is MovieListSearching) {
      return const LoadingWidget();
    } else if (state is MovieListSearchDone) {
      return MovieListWidget(
        movies: state.movies,
        onDetails: (movie) => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailsPage(movie: movie)),
        ),
      );
    }

    return Container();
  }
}
