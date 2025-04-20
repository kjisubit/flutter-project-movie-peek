abstract class UpcomingMoviesEvent {}

class FetchUpcomingMovies extends UpcomingMoviesEvent {
  final int page;

  FetchUpcomingMovies({required this.page});
}
