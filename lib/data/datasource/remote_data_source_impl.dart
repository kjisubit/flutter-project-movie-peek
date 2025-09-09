import 'package:dio/dio.dart';
import 'package:movie_peek/data/datasource/remote_data_source.dart';
import 'package:movie_peek/data/dto/movie_details/movie_details_dto.dart';
import 'package:movie_peek/data/dto/movie_list_response_dto.dart';
import 'package:movie_peek/utils/locale_manager.dart';

import '../../constants/api_constants.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceImpl(this._dio);

  @override
  Future<MovieListResponseDto> getPopularMovies({required int page}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.tmdbBaseUrl}movie/popular',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': page,
          'language': LocaleManager().languageCode,
        },
      );
      return MovieListResponseDto.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieListResponseDto> getUpcomingMovies({required int page}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.tmdbBaseUrl}movie/upcoming',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': page,
          'language': LocaleManager().languageCode,
        },
      );
      return MovieListResponseDto.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsDto> getMovieDetails({required int movieId}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.tmdbBaseUrl}movie/$movieId',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'movie_id': movieId,
          'language': LocaleManager().languageCode,
        },
      );
      return MovieDetailsDto.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
