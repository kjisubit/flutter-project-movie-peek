abstract class PopularMoviesEvent {}

class FetchPopularMovies extends PopularMoviesEvent {
  final int page;

  FetchPopularMovies({required this.page});
}
