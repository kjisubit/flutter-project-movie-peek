import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_event.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_state.dart';
import 'package:movie_peek/presentation/widgets/custom_text.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<PopularMoviesBloc>()..add(FetchPopularMovies(page: 1)),
      child: const _PopularScreen(),
    );
  }
}

class _PopularScreen extends StatelessWidget {
  const _PopularScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PopularMoviesSuccess) {
            return _buildMovieDetails(state.movies.movies ?? []);
          } else if (state is PopularMoviesFailure) {
            return _buildError(state.exception);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildMovieDetails(List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(title: CustomText(movie.title ?? 'No Title'));
      },
    );
  }

  Widget _buildError(Exception exception) {
    return Center(child: CustomText('Error: $exception'));
  }
}
