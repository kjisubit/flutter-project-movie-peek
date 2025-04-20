import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_event.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MovieUseCase movieUseCase;

  UpcomingMoviesBloc(this.movieUseCase) : super(UpcomingMoviesInitial()) {
    on<FetchUpcomingMovies>(_onFetchUpcomingMovies);
  }

  Future<void> _onFetchUpcomingMovies(
    FetchUpcomingMovies event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    emit(UpcomingMoviesLoading());
    final result = await movieUseCase.getUpcomingMovies(page: event.page);
    if (result is Success<MovieList>) {
      emit(UpcomingMoviesSuccess(result.data));
    } else if (result is Error<MovieList>) {
      emit(UpcomingMoviesFailure(result.exception));
    }
  }
}
