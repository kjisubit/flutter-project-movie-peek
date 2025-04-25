import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_event.dart';
import 'package:movie_peek/presentation/blocs/upcoming/upcoming_movies_state.dart';

import '../../../domain/model/api_result.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MovieUseCase movieUseCase;
  final List<Movie> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;

  UpcomingMoviesBloc(this.movieUseCase) : super(UpcomingMoviesInitial()) {
    on<FetchUpcomingMovies>(_onFetchUpcomingMovies);
  }

  Future<void> _onFetchUpcomingMovies(
    FetchUpcomingMovies event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    if (_isFetching) return;
    _isFetching = true;

    if (_currentPage == 1) {
      emit(UpcomingMoviesLoading());
    }

    final result = await movieUseCase.getUpcomingMovies(page: _currentPage);

    if (result is Success<MovieList>) {
      _movies.addAll(result.data.movies ?? []);
      emit(UpcomingMoviesSuccess(MovieList(movies: _movies)));
      _currentPage++;
    } else if (result is Error<MovieList>) {
      emit(UpcomingMoviesFailure(result.exception));
    }

    _isFetching = false;
  }
}
