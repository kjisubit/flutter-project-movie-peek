import 'package:movie_peek/domain/model/movie.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final Movie movie;

  MovieDetailsSuccess(this.movie);
}

class MovieDetailsFailure extends MovieDetailsState {
  final Exception exception;

  MovieDetailsFailure(this.exception);
}
