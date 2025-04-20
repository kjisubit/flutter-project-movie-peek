import 'package:movie_peek/domain/model/movie_list.dart';

abstract class UpcomingMoviesState {}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final MovieList movies;

  UpcomingMoviesSuccess(this.movies);
}

class UpcomingMoviesFailure extends UpcomingMoviesState {
  final Exception exception;

  UpcomingMoviesFailure(this.exception);
}
