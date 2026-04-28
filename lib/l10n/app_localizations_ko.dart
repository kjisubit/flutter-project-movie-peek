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

  @override
  String get showcase => '쇼케이스';

  @override
  String get nativeScreen => '네이티브 화면';

  @override
  String get nativeScreenDesc => '네이티브 Android/iOS UI로 만든 화면으로 이동';

  @override
  String get platformView => '플랫폼 뷰';

  @override
  String get platformViewDesc => '플러터 화면에 네이티브 UI 컴포넌트 삽입';
}
