import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_event.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_state.dart';
import 'package:movie_peek/presentation/widgets/custom_text.dart';
import 'package:movie_peek/presentation/widgets/movie_list_item.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<UpcomingMoviesBloc>()..add(FetchUpcomingMovies(page: 1)),
      child: const _UpcomingScreen(),
    );
  }
}

class _UpcomingScreen extends StatelessWidget {
  const _UpcomingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UpcomingMoviesSuccess) {
            return _buildMovieList(state.movies.movies ?? []);
          } else if (state is UpcomingMoviesFailure) {
            return _buildError(state.exception);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildMovieList(List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        //return ListTile(title: CustomText(movie.title ?? 'No Title'));
        return MovieListItem(title: movie.title ?? '', posterUrl: movie.posterPath ?? '');
      },
    );
  }

  Widget _buildError(Exception exception) {
    return Center(child: CustomText('Error: $exception'));
  }
}
