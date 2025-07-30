import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/presentation/feature/detail/detail_screen.dart';
import 'package:movie_peek/presentation/feature/home/home_screen.dart';
import 'package:movie_peek/presentation/feature/intro/intro_screen.dart';
import 'package:movie_peek/routes/route_list.dart';

final List<RouteBase> goRoutes = <RouteBase>[
  GoRoute(
    path: '/',
    name: RouteList.intro,
    builder: (BuildContext context, GoRouterState state) {
      return const IntroScreen();
    },
  ),
  GoRoute(
    path: '/${RouteList.home}',
    name: RouteList.home,
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/${RouteList.detail}/:movieId',
    name: RouteList.detail,
    builder: (context, state) {
      final movie = state.extra as Movie?;
      if (movie == null) {
        return Scaffold(
          body: Center(child: Text('Movie data is missing')),
        );
      }
      return DetailScreen(movie: movie);
    },
  ),
];
