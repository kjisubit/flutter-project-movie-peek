// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get goToDetail => 'Go to Detail';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get popular => 'Popular';

  @override
  String get todayPopular => 'Today\'s Popular';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get noTitle => 'No Title';

  @override
  String get noOverviewAvailable => 'No Overview Available';

  @override
  String get showcase => 'Showcase';

  @override
  String get nativeScreen => 'Native Screen';

  @override
  String get nativeScreenDesc =>
      'Navigate to a screen built with native Android/iOS UI';

  @override
  String get platformView => 'Platform View';

  @override
  String get platformViewDesc =>
      'Embed native UI components inside a Flutter screen';
}
