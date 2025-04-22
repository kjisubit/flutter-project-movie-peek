import 'dart:ui';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_peek/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('홈 화면 이동 후, 오늘의 인기 영화 상세 정보 보기 버튼 노출 여부 확인', (WidgetTester tester) async {
    final deviceLocale = PlatformDispatcher.instance.locale;
    final localizations = await AppLocalizations.delegate.load(deviceLocale);

    app.main();
    await tester.pumpAndSettle();

    final goToHomeButton = find.text(localizations.goToHome);
    expect(goToHomeButton, findsOneWidget);

    await tester.tap(goToHomeButton);
    await tester.pumpAndSettle();

    final goToDetailText = find.text(localizations.goToDetail);

    final timeout = DateTime.now().add(const Duration(milliseconds: 10000));
    while (DateTime.now().isBefore(timeout)) {
      await tester.pump(const Duration(milliseconds: 100));
      if (goToDetailText.evaluate().isNotEmpty) {
        break;
      }
    }

    expect(goToDetailText, findsOneWidget);
  });
}
