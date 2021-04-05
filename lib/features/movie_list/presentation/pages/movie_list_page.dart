import 'package:Movies/features/movie_list/presentation/cubits/cubit/movie_list_cubit.dart';
import 'package:Movies/features/movie_list/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieListCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Filmes"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _showSearchField(context),
              ),
            ],
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  void _showSearchField(BuildContext context) {
    BlocProvider.of<MovieListCubit>(context).search("Batman");
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
      return MovieListWidget(movies: state.movies);
    }

    return Container();
  }
}
