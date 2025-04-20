import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
];
