import 'package:movie_peek/data/dto/movie_dto.dart';
import 'package:movie_peek/data/dto/movie_list_response_dto.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';

class ModelMapper {
  static Movie mapMovieDtoToDomain(MovieDto dto) {
    return Movie(
      id: dto.id?.toInt(),
      overview: dto.overview,
      popularity: dto.popularity?.toDouble(),
      posterPath: dto.posterPath,
      title: dto.title,
      voteAverage: dto.voteAverage?.toDouble(),
      voteCount: dto.voteCount?.toInt(),
    );
  }

  static MovieList mapMovieListDtoToDomain(MovieListResponseDto dto) {
    final results = dto.results ?? [];
    final movies = results.map(mapMovieDtoToDomain).toList();

    return MovieList(
      page: dto.page?.toInt(),
      totalPages: dto.totalPages?.toInt(),
      totalResults: dto.totalResults?.toInt(),
      movies: movies,
    );
  }
}
