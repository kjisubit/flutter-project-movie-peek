import 'package:dio/dio.dart';
import 'package:movie_peek/data/datasource/remote_data_source.dart';
import 'package:movie_peek/data/mapper/model_mapper.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<MovieList>> getPopularMovies({required int page}) async {
    try {
      final dto = await remoteDataSource.getPopularMovies(page: page);
      final movies = ModelMapper.toDomain(dto);
      return Success(movies);
    } on DioException catch (e) {
      return Error(Exception('DioException: $e'));
    } catch (e) {
      return Error(Exception('Unknown Error: $e'));
    }
  }

  @override
  Future<ApiResult<MovieList>> getUpcomingMovies({required int page}) async {
    try {
      final dto = await remoteDataSource.getUpcomingMovies(page: page);
      final movies = ModelMapper.toDomain(dto);
      return Success(movies);
    } on DioException catch (e) {
      return Error(Exception('DioException: $e'));
    } catch (e) {
      return Error(Exception('Unknown Error: $e'));
    }
  }
}
