import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/l10n/app_localizations.dart';
import 'package:movie_peek/main.dart' as app;
import 'package:movie_peek/utils/locale_manager.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Navigation Tests', () {
    testWidgets('navigates to details screen of today\'s popular movie', (
      WidgetTester tester,
    ) async {
      // Given: 앱 실행 및 초기화
      await app.main();
      await tester.pumpAndSettle();

      // Given: 디바이스 로케일 정보 로드
      final locale = LocaleManager().locale;
      final localizations = await AppLocalizations.delegate.load(locale);

      // Given: useCase 준비
      final useCase = injector<MovieUseCase>();

      // Given: API 호출 대기 시간 설정
      final timeout = DateTime.now().add(const Duration(seconds: 10));

      // Given: 오늘의 인기 영화 데이터 준비
      late Movie? todayPopularMovie;
      await useCase.getPopularMovies(page: 1).then((value) {
        if (value is Success) {
          todayPopularMovie = (value as Success<MovieList>).data.movies?[0];
        } else if (value is Error) {
          fail('API 호출 실패: ${(value as Error).exception}');
        }
      });

      // Given: 영화 디테일 정보 준비
      late String? movieTitle;
      await useCase.getMovieDetails(movieId: todayPopularMovie!.id!).then((
        value,
      ) {
        if (value is Success) {
          movieTitle = (value as Success<Movie>).data.title;
        } else if (value is Error) {
          fail('API 호출 실패: ${(value as Error).exception}');
        }
      });
      if (movieTitle == null) fail('title 데이터가 존재하지 않습니다.');

      // When: 홈 화면으로 이동
      final goToHomeFinder = find.text(localizations.goToHome);
      expect(goToHomeFinder, findsOneWidget);
      await tester.tap(goToHomeFinder);
      await tester.pumpAndSettle();

      // When: 이미지 로딩이 완료된 후에 상세 정보 보기 버튼 노출되는지 확인
      // 이미지를 로딩하는 동안 별도의 로딩창을 보여주지 않으므로 pumpAndSettle()을 사용하지 않았음
      final goToDetailFinder = find.text(localizations.goToDetail);
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
      final movieTitleFinder = find.text(movieTitle!);
      expect(movieTitleFinder, findsOneWidget);
    });
  });
}