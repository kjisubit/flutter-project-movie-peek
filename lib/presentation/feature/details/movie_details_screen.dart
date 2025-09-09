import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/details/movie_details_bloc.dart';
import 'package:movie_peek/presentation/blocs/details/movie_details_event.dart';
import 'package:movie_peek/presentation/blocs/details/movie_details_state.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
      injector<MovieDetailsBloc>()
        ..add(FetchMovieDetails(movieId: movieId)),
      child: const _MovieDetailsScreen(),
    );
  }
}

class _MovieDetailsScreen extends StatelessWidget {
  const _MovieDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsSuccess) {
            final movie = state.movie;
            return _buildBody(movie);
          } else if (state is MovieDetailsFailure) {
            return _buildError(state.exception);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildBody(Movie movie) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (movie.posterPath != null)
            CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              movie.title ?? 'No Title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(movie.overview ?? 'No Overview Available'),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Exception exception) {
    return Center(child: Text('Error: $exception'));
  }
}
