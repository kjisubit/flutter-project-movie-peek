import 'package:movie_peek/domain/model/movie_list.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final MovieList movies;

  PopularMoviesSuccess(this.movies);
}

class PopularMoviesFailure extends PopularMoviesState {
  final Exception exception;

  PopularMoviesFailure(this.exception);
}
