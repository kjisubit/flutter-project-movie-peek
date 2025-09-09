class BelongsToCollection {
  BelongsToCollection({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    _id = id;
    _name = name;
    _posterPath = posterPath;
    _backdropPath = backdropPath;
  }

  BelongsToCollection.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _posterPath = json['poster_path'];
    _backdropPath = json['backdrop_path'];
  }

  num? _id;
  String? _name;
  String? _posterPath;
  String? _backdropPath;

  BelongsToCollection copyWith({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) => BelongsToCollection(
    id: id ?? _id,
    name: name ?? _name,
    posterPath: posterPath ?? _posterPath,
    backdropPath: backdropPath ?? _backdropPath,
  );

  num? get id => _id;

  String? get name => _name;

  String? get posterPath => _posterPath;

  String? get backdropPath => _backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['poster_path'] = _posterPath;
    map['backdrop_path'] = _backdropPath;
    return map;
  }
}
