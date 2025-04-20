import 'package:movie_peek/domain/model/movie.dart';

class MovieList {
  final int? page;
  final List<Movie>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieList({this.page, this.movies, this.totalPages, this.totalResults});
}
