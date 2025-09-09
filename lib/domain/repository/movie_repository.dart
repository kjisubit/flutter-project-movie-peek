import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';

abstract class MovieRepository {
  Future<ApiResult<MovieList>> getPopularMovies({required int page});

  Future<ApiResult<MovieList>> getUpcomingMovies({required int page});

  Future<ApiResult<Movie>> getMovieDetails({required int movieId});
}
