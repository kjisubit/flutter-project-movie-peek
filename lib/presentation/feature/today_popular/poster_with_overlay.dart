import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_peek/constants/api_constants.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/presentation/blocs/image_load/image_load_bloc.dart';
import 'package:movie_peek/presentation/blocs/image_load/image_load_event.dart';
import 'package:movie_peek/presentation/blocs/image_load/image_load_state.dart';
import 'package:movie_peek/presentation/feature/detail/detail_screen.dart';
import 'package:movie_peek/presentation/widgets/custom_button.dart';

class PosterWithOverlay extends StatelessWidget {
  final Movie movie;

  const PosterWithOverlay({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ImageLoadBloc>()..add(ImageLoadStarted()),
      child: _PosterWithOverlay(movie: movie),
    );
  }
}

class _PosterWithOverlay extends StatelessWidget {
  final Movie movie;

  const _PosterWithOverlay({required this.movie});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        '${ApiConstants.tmdbPosterUrl}${ApiConstants.posterFull}${movie.posterPath}';
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Container(color: Colors.grey),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          imageBuilder: (context, imageProvider) {
            context.read<ImageLoadBloc>().add(ImageLoadCompleted());
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            );
          },
        ),
        BlocBuilder<ImageLoadBloc, ImageLoadState>(
          builder: (context, state) {
            switch (state) {
              case ImageLoadInProgress():
                return const SizedBox();
              case ImageLoadFinished():
                return _buildOverlayContent(context, movie);
              default:
                return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

Widget _buildOverlayContent(BuildContext context, Movie movie) {
  final screenSize = MediaQuery.of(context).size;
  final vote = movie.voteAverage ?? 0.0;
  final progress = vote / 10.0;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          final animatedText = '★ ${(value * 10).toStringAsFixed(0)}/10';
          return CustomPaint(
            size: Size(screenSize.width, screenSize.width),
            painter: _DonutChartPainter(
              progress: value,
              displayText: animatedText,
            ),
          );
        },
      ),
      const SizedBox(height: 16),
      MoviePeekButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(movie: movie),
              ),
            ),
        radius: 50,
        child: Text(AppLocalizations.of(context)!.goToDetail),
      ),
    ],
  );
}

class _DonutChartPainter extends CustomPainter {
  final double progress;
  final String displayText;

  _DonutChartPainter({required this.progress, required this.displayText});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 4;
    final center = size.center(Offset.zero);

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10;

    // 배경 원
    paint.color = Colors.white.withAlpha((255 * 0.2).toInt());
    canvas.drawCircle(center, radius, paint);

    // 진행 아크
    paint.color = Colors.blueAccent;
    final sweepAngle = progress * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );

    // 텍스트
    final textSpan = TextSpan(
      text: displayText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout();
    final offset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.displayText != displayText;
  }
}
