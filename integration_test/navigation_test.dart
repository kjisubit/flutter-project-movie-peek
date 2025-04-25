import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';
import 'package:movie_peek/injector.dart';
import 'package:movie_peek/main.dart' as app;
import 'package:movie_peek/utils/LocaleManager.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('홈 화면 이동 후, 오늘의 인기 영화 상세 정보 보기 버튼 노출 여부 확인', (WidgetTester tester) async {
    // 앱 실행
    await app.main();

    // Given: 디바이스 로케일 정보 로드
    final locale = LocaleManager().locale;
    final localizations = await AppLocalizations.delegate.load(locale);

    // Given: 인기 영화 데이터 준비
    final useCase = injector<MovieUseCase>();
    late String todayPopularMovie;
    await useCase.getPopularMovies(page: 1).then((value) {
      if (value is Success) {
        todayPopularMovie = (value as Success<MovieList>).data.movies?[0].title ?? '';
      } else if (value is Error) {
        fail('API 호출 실패: ${(value as Error).exception}');
      }
    });

    // When: 앱을 실행 후 IntroScreen에서 "goToHome" 버튼을 클릭
    await tester.pumpAndSettle();
    final goToHomeButton = find.text(localizations.goToHome);
    expect(goToHomeButton, findsOneWidget);
    await tester.tap(goToHomeButton);
    await tester.pumpAndSettle();

    // Then: 홈 화면에서 "goToDetail" 버튼이 노출될 때까지 기다린 후 클릭
    final goToDetailButton = find.text(localizations.goToDetail);
    final timeout = DateTime.now().add(const Duration(milliseconds: 10000));
    while (DateTime.now().isBefore(timeout)) {
      await tester.pump(const Duration(milliseconds: 100));
      if (goToDetailButton.evaluate().isNotEmpty) {
        break;
      }
    }
    expect(goToDetailButton, findsOneWidget);
    await tester.tap(goToDetailButton);
    await tester.pumpAndSettle();
  });
}
