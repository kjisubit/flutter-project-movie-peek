import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_event.dart';
import 'package:movie_peek/presentation/blocs/popular/popular_movies_state.dart';

import '../../../domain/model/api_result.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final MovieUseCase movieUseCase;

  PopularMoviesBloc(this.movieUseCase) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>(_onFetchPopularMovies);
  }

  Future<void> _onFetchPopularMovies(
    FetchPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());
    final result = await movieUseCase.getPopularMovies(page: event.page);
    if (result is Success<MovieList>) {
      emit(PopularMoviesSuccess(result.data));
    } else if (result is Error<MovieList>) {
      emit(PopularMoviesFailure(result.exception));
    }
  }
}
