import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository _movieRepository;

  const MovieUseCase(this._movieRepository);

  Future<ApiResult<MovieList>> getPopularMovies({required int page}) async {
    return _movieRepository.getPopularMovies(page: page);
  }

  Future<ApiResult<MovieList>> getUpcomingMovies({required int page}) async {
    return _movieRepository.getUpcomingMovies(page: page);
  }
}
