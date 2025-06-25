// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get goToDetail => '상세 정보 보기';

  @override
  String get goToHome => '홈으로 이동';

  @override
  String get popular => '인기 영화';

  @override
  String get todayPopular => '오늘의 인기 영화';

  @override
  String get upcoming => '개봉 예정';

  @override
  String get noTitle => '제목 없음';

  @override
  String get noOverviewAvailable => '개요 데이터가 존재하지 않습니다.';
}
