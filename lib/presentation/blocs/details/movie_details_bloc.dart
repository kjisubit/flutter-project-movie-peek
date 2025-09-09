import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/presentation/blocs/details/movie_details_event.dart';
import 'package:movie_peek/presentation/blocs/details/movie_details_state.dart';

import '../../../domain/model/api_result.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieUseCase movieUseCase;

  MovieDetailsBloc(this.movieUseCase) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
    FetchMovieDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoading());
    final result = await movieUseCase.getMovieDetails(movieId: event.movieId);
    if (result is Success<Movie>) {
      emit(MovieDetailsSuccess(result.data));
    } else if (result is Error<Movie>) {
      emit(MovieDetailsFailure(result.exception));
    }
  }
}
