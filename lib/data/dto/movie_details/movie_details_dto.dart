import 'belongs_to_collection_dto.dart';
import 'genres_dto.dart';
import 'production_companies_dto.dart';
import 'production_countries_dto.dart';
import 'spoken_languages_dto.dart';

class MovieDetailsDto {
  MovieDetailsDto({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    num? budget,
    List<Genres>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _budget = budget;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  MovieDetailsDto.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _belongsToCollection =
        json['belongs_to_collection'] != null
            ? BelongsToCollection.fromJson(json['belongs_to_collection'])
            : null;
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originCountry =
        json['origin_country'] != null
            ? json['origin_country'].cast<String>()
            : [];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  bool? _adult;
  String? _backdropPath;
  BelongsToCollection? _belongsToCollection;
  num? _budget;
  List<Genres>? _genres;
  String? _homepage;
  num? _id;
  String? _imdbId;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  String? _releaseDate;
  num? _revenue;
  num? _runtime;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;

  MovieDetailsDto copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    num? budget,
    List<Genres>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) => MovieDetailsDto(
    adult: adult ?? _adult,
    backdropPath: backdropPath ?? _backdropPath,
    belongsToCollection: belongsToCollection ?? _belongsToCollection,
    budget: budget ?? _budget,
    genres: genres ?? _genres,
    homepage: homepage ?? _homepage,
    id: id ?? _id,
    imdbId: imdbId ?? _imdbId,
    originCountry: originCountry ?? _originCountry,
    originalLanguage: originalLanguage ?? _originalLanguage,
    originalTitle: originalTitle ?? _originalTitle,
    overview: overview ?? _overview,
    popularity: popularity ?? _popularity,
    posterPath: posterPath ?? _posterPath,
    productionCompanies: productionCompanies ?? _productionCompanies,
    productionCountries: productionCountries ?? _productionCountries,
    releaseDate: releaseDate ?? _releaseDate,
    revenue: revenue ?? _revenue,
    runtime: runtime ?? _runtime,
    spokenLanguages: spokenLanguages ?? _spokenLanguages,
    status: status ?? _status,
    tagline: tagline ?? _tagline,
    title: title ?? _title,
    video: video ?? _video,
    voteAverage: voteAverage ?? _voteAverage,
    voteCount: voteCount ?? _voteCount,
  );

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  BelongsToCollection? get belongsToCollection => _belongsToCollection;

  num? get budget => _budget;

  List<Genres>? get genres => _genres;

  String? get homepage => _homepage;

  num? get id => _id;

  String? get imdbId => _imdbId;

  List<String>? get originCountry => _originCountry;

  String? get originalLanguage => _originalLanguage;

  String? get originalTitle => _originalTitle;

  String? get overview => _overview;

  num? get popularity => _popularity;

  String? get posterPath => _posterPath;

  List<ProductionCompanies>? get productionCompanies => _productionCompanies;

  List<ProductionCountries>? get productionCountries => _productionCountries;

  String? get releaseDate => _releaseDate;

  num? get revenue => _revenue;

  num? get runtime => _runtime;

  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;

  String? get status => _status;

  String? get tagline => _tagline;

  String? get title => _title;

  bool? get video => _video;

  num? get voteAverage => _voteAverage;

  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    if (_belongsToCollection != null) {
      map['belongs_to_collection'] = _belongsToCollection?.toJson();
    }
    map['budget'] = _budget;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] =
          _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] =
          _productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = _releaseDate;
    map['revenue'] = _revenue;
    map['runtime'] = _runtime;
    if (_spokenLanguages != null) {
      map['spoken_languages'] =
          _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }
}
