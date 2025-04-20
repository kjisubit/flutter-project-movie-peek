import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String tmdbBaseUrl = 'https://api.themoviedb.org/3/';
  static const String tmdbPosterUrl = 'https://image.tmdb.org/t/p/';

  static String get apiKey => dotenv.env['TMDB_API_KEY'] ?? '';

  static const posterSmall = 'w92';
  static const posterMedium = 'w154';
  static const posterLarge = 'w185';
  static const posterXLarge = 'w342';
  static const posterXXLarge = 'w500';
  static const posterFull = 'original';
}
