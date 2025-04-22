import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_event.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_state.dart';
import 'package:movie_peek/presentation/widgets/movie_list_item.dart';

import '../../../domain/model/movie.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              injector<UpcomingMoviesBloc>()..add(FetchUpcomingMovies()),
      child: const _UpcomingScreen(),
    );
  }
}

class _UpcomingScreen extends StatelessWidget {
  const _UpcomingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _UpcomingMoviesList());
  }
}

class _UpcomingMoviesList extends StatefulWidget {
  const _UpcomingMoviesList();

  @override
  State<_UpcomingMoviesList> createState() => _UpcomingMoviesListState();
}

class _UpcomingMoviesListState extends State<_UpcomingMoviesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<UpcomingMoviesBloc>().add(FetchUpcomingMovies());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UpcomingMoviesSuccess) {
          return _buildMovieList(state.movies.movies ?? []);
        } else if (state is UpcomingMoviesFailure) {
          return Center(child: Text('Error: ${state.exception}'));
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildMovieList(List<Movie> movies) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieListItem(
          title: movie.title ?? '',
          posterUrl: movie.posterPath ?? '',
        );
      },
    );
  }
}
