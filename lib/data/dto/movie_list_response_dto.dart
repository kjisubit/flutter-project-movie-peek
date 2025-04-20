import 'movie_dto.dart';

class MovieListResponseDto {
  MovieListResponseDto({num? page, List<MovieDto>? results, num? totalPages, num? totalResults}) {
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  MovieListResponseDto.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(MovieDto.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  num? _page;
  List<MovieDto>? _results;
  num? _totalPages;
  num? _totalResults;

  MovieListResponseDto copyWith({
    num? page,
    List<MovieDto>? results,
    num? totalPages,
    num? totalResults,
  }) => MovieListResponseDto(
    page: page ?? _page,
    results: results ?? _results,
    totalPages: totalPages ?? _totalPages,
    totalResults: totalResults ?? _totalResults,
  );

  num? get page => _page;

  List<MovieDto>? get results => _results;

  num? get totalPages => _totalPages;

  num? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }
}
