import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_peek/data/datasource/remote_data_source.dart';
import 'package:movie_peek/data/datasource/remote_data_source_impl.dart';
import 'package:movie_peek/data/repository/movie_repository_impl.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/presentation/blocs/image_load/image_load_bloc.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_bloc.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_bloc.dart';

import 'domain/repository/movie_repository.dart';

final injector = GetIt.instance;

Future<void> initInjector() async {
  injector
    // Dio
    ..registerLazySingleton<Dio>(Dio.new)
    // Data Source
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(injector<Dio>()),
    )
    // Repository
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(injector<RemoteDataSource>()),
    )
    // Use Case
    ..registerLazySingleton<MovieUseCase>(
      () => MovieUseCase(injector<MovieRepository>()),
    )
    // Bloc -> 싱글톤 등록 시 블록의 다회차 생성 불가하므로 factory 등록 필요
    ..registerFactory<ImageLoadBloc>(() => ImageLoadBloc())
    ..registerFactory<PopularMoviesBloc>(
      () => PopularMoviesBloc(injector<MovieUseCase>()),
    )
    ..registerFactory<UpcomingMoviesBloc>(
      () => UpcomingMoviesBloc(injector<MovieUseCase>()),
    );
}
