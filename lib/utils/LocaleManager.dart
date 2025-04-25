import 'package:flutter/material.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._internal();

  factory LocaleManager() {
    return _instance;
  }

  LocaleManager._internal();

  late Locale _locale;
  late String _languageCode;

  void initialize(Locale locale) {
    _locale = locale;
    _languageCode = '${locale.languageCode}-${locale.countryCode}';
  }

  Locale get locale => _locale;

  String get languageCode => _languageCode;
}
