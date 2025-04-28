import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_event.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_state.dart';
import 'package:movie_peek/presentation/feature/today_popular/poster_with_overlay.dart';

class TodayPopularScreen extends StatelessWidget {
  const TodayPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
      injector<PopularMoviesBloc>()..add(FetchPopularMovies(page: 1)),
      child: const _TodayPopularScreen(),
    );
  }
}

class _TodayPopularScreen extends StatelessWidget {
  const _TodayPopularScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PopularMoviesSuccess) {
            final movies = state.movies.movies ?? [];
            if (movies.isEmpty) {
              return const SizedBox();
            } else {
              final movie = movies[0];
              return PosterWithOverlay(movie: movie);
            }
          } else if (state is PopularMoviesFailure) {
            return _buildError(state.exception);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildError(Exception exception) {
    return Center(child: Text('Error: $exception'));
  }
}
