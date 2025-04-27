import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/main.dart' as app;
import 'package:movie_peek/presentation/widgets/movie_list_item.dart';
import 'package:movie_peek/utils/LocaleManager.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('오늘의 인기 영화를 상세 화면에서 확인', (WidgetTester tester) async {
    // Given: 앱 실행 및 초기화
    await app.main();
    await tester.pumpAndSettle();

    // Given: 디바이스 로케일 정보 로드
    final locale = LocaleManager().locale;
    final localizations = await AppLocalizations.delegate.load(locale);

    // Given: 오늘의 인기 영화 데이터 준비
    final useCase = injector<MovieUseCase>();
    late Movie? todayPopularMovie;
    await useCase.getPopularMovies(page: 1).then((value) {
      if (value is Success) {
        todayPopularMovie = (value as Success<MovieList>).data.movies?[0];
      } else if (value is Error) {
        fail('API 호출 실패: ${(value as Error).exception}');
      }
    });

    // When: 홈 화면으로 이동
    final goToHomeFinder = find.text(localizations.goToHome);
    expect(goToHomeFinder, findsOneWidget);
    await tester.tap(goToHomeFinder);
    await tester.pumpAndSettle();

    // When: 상세 정보 보기 버튼 대기
    final goToDetailFinder = find.text(localizations.goToDetail);
    final timeout = DateTime.now().add(const Duration(seconds: 10));
    while (DateTime.now().isBefore(timeout)) {
      await tester.pump(const Duration(milliseconds: 100));
      if (goToDetailFinder.evaluate().isNotEmpty) {
        break;
      }
    }
    expect(goToDetailFinder, findsOneWidget);

    // When: 상세 정보 보기 버튼 클릭
    await tester.tap(goToDetailFinder);
    await tester.pumpAndSettle();

    // Then: 상세 화면에서 영화 제목이 노출되는지 확인
    final movieTitle = todayPopularMovie?.title ?? '';
    final movieTitleFinder = find.text(movieTitle);
    expect(movieTitleFinder, findsOneWidget);
  });

  testWidgets('개봉 예정 목록에서 원하는 영화의 상세 정보 확인', (WidgetTester tester) async {
    // Given: 앱 실행 및 초기화
    await app.main();
    await tester.pumpAndSettle();

    // Given: 디바이스 로케일 정보 로드
    final locale = LocaleManager().locale;
    final localizations = await AppLocalizations.delegate.load(locale);

    // Given: 개봉 예정 영화 데이터 준비
    final targetIndex = 19;
    final useCase = injector<MovieUseCase>();
    late Movie? movie;
    await useCase.getUpcomingMovies(page: 1).then((value) {
      if (value is Success) {
        movie = (value as Success<MovieList>).data.movies?[targetIndex];
      } else if (value is Error) {
        fail('API 호출 실패: ${(value as Error).exception}');
      }
    });

    // Given: 영화 제목 준비
    final movieTitle = movie?.title ?? '';

    // When: 홈 화면으로 이동
    final goToHomeFinder = find.text(localizations.goToHome);
    expect(goToHomeFinder, findsOneWidget);
    await tester.tap(goToHomeFinder);
    await tester.pumpAndSettle();

    // When: 개봉 예정 탭으로 이동
    final upcomingFinder = find.text(localizations.upcoming);
    expect(upcomingFinder, findsOneWidget);
    await tester.tap(upcomingFinder);
    await tester.pumpAndSettle();

    // Then: 영화 목록에서 대상 영화가 스크롤로 노출되는지 확인
    final scrollableFinder = find.byType(Scrollable);
    final movieTitleFinder = find.text(movieTitle);
    await tester.scrollUntilVisible(
      movieTitleFinder,
      300.0, // 한 번에 스크롤할 거리
      scrollable: scrollableFinder,
    );
    await tester.pumpAndSettle();

    // Then: 영화 항목이 목록에 존재하는지 확인
    final movieItemFinder = find.descendant(
      of: find.byType(MovieListItem),
      matching: find.text(movieTitle),
    );
    expect(movieItemFinder, findsOneWidget);

    // When: 영화 항목 클릭
    await tester.tap(movieItemFinder);
    await tester.pumpAndSettle();

    // Then: 상세 화면에서 영화 제목이 노출되는지 확인
    expect(movieTitleFinder, findsOneWidget);
  });
}
