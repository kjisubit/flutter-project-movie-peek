import 'package:movie_peek/data/dto/movie_list_response_dto.dart';

abstract class RemoteDataSource {
  Future<MovieListResponseDto> getPopularMovies({required int page});

  Future<MovieListResponseDto> getUpcomingMovies({required int page});
}
