import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_peek/domain/model/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';

    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? 'Movie Detail')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.posterPath != null)
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // overview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(movie.overview ?? 'No Overview Available'),
            ),
          ],
        ),
      ),
    );
  }
}
