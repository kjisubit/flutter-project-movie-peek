import 'package:movie_peek/data/dto/movie_details/movie_details_dto.dart';
import 'package:movie_peek/data/dto/movie_list_response_dto.dart';

abstract class RemoteDataSource {
  Future<MovieListResponseDto> getPopularMovies({required int page});

  Future<MovieListResponseDto> getUpcomingMovies({required int page});

  Future<MovieDetailsDto> getMovieDetails({required int movieId});
}
