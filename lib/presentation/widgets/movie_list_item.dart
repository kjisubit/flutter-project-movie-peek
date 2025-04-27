import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_peek/constants/api_constants.dart';

import 'movie_surface.dart';

class MovieListItem extends StatelessWidget {
  final String title;
  final String posterUrl;
  final VoidCallback onTap;

  const MovieListItem({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MovieSurface(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiConstants.tmdbPosterUrl}${ApiConstants.posterXLarge}$posterUrl',
                placeholder:
                    (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(child: Text(title)),
          ],
        ),
      ),
    );
  }
}
