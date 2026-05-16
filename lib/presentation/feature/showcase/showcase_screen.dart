import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/constants/api_constants.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/l10n/app_localizations.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_event.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_state.dart';
import 'package:movie_peek/presentation/widgets/movie_surface.dart';
import 'package:movie_peek/routes/route_list.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

const _channel = MethodChannel('com.js.movie_peek/native');

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<PopularMoviesBloc>(),
      child: const _ShowcaseScreen(),
    );
  }
}

class _ShowcaseScreen extends StatelessWidget {
  const _ShowcaseScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<PopularMoviesBloc, PopularMoviesState>(
      listenWhen: (_, current) =>
          current is PopularMoviesSuccess || current is PopularMoviesFailure,
      listener: (context, state) {
        if (state is PopularMoviesSuccess) {
          final movies = state.movies.movies ?? [];
          if (movies.isNotEmpty) _openNativeScreen(movies[0]);
        } else if (state is PopularMoviesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.nativeScreenLoadError)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _ShowcaseItem(
                    title: l10n.nativeScreen,
                    description: l10n.nativeScreenDesc,
                    onTap: () => context
                        .read<PopularMoviesBloc>()
                        .add(FetchPopularMovies(page: 1)),
                  ),
                  const SizedBox(height: 12),
                  _ShowcaseItem(
                    title: l10n.platformView,
                    description: l10n.platformViewDesc,
                    onTap: () => context.pushNamed(RouteList.platformView),
                  ),
                ],
              ),
              if (state is PopularMoviesLoading)
                const ColoredBox(
                  color: Colors.black38,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openNativeScreen(Movie movie) async {
    final posterUrl =
        movie.posterPath != null
            ? '${ApiConstants.tmdbPosterUrl}${ApiConstants.posterXXLarge}${movie.posterPath}'
            : '';
    await _channel.invokeMethod('openNativeMovieScreen', {
      'title': movie.title ?? '',
      'posterUrl': posterUrl,
      'rating': movie.voteAverage ?? 0.0,
    });
  }
}

class _ShowcaseItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const _ShowcaseItem({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomThemeColors>()!;
    return MovieSurface(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colors.onBackgroundActive,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: colors.onBackgroundInactive,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colors.onBackgroundInactive),
        ],
      ),
    );
  }
}