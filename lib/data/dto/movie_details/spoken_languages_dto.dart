class SpokenLanguages {
  SpokenLanguages({String? englishName, String? iso6391, String? name}) {
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
  }

  SpokenLanguages.fromJson(dynamic json) {
    _englishName = json['english_name'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }

  String? _englishName;
  String? _iso6391;
  String? _name;

  SpokenLanguages copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) => SpokenLanguages(
    englishName: englishName ?? _englishName,
    iso6391: iso6391 ?? _iso6391,
    name: name ?? _name,
  );

  String? get englishName => _englishName;

  String? get iso6391 => _iso6391;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;
    return map;
  }
}
