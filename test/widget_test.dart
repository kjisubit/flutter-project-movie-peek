// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/presentation/widgets/donut_chart_painter.dart';
import 'package:movie_peek/presentation/widgets/movie_list_item.dart';
import 'package:movie_peek/presentation/widgets/movie_surface.dart';
import 'package:movie_peek/theme/app_theme.dart';
import 'package:movie_peek/utils/string_formatter.dart';

void main() {
  testWidgets('MovieListItem 영화 데이터 렌더링 여부 확인', (WidgetTester tester) async {
    // Given: 테스트용 Movie 데이터 생성
    const testMovie = Movie(
      id: 1,
      title: 'Test Movie',
      overview: 'This is a test movie.',
    );

    // When: movie_surface 위젯 렌더링
    await tester.pumpWidget(
      MaterialApp(
        home: MovieSurface(
          child: MovieListItem(
            title: testMovie.title ?? '',
            posterUrl: testMovie.posterPath ?? '',
            onTap: () {},
          ),
        ),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
      ),
    );

    // Then: 영화 제목이 화면에 표시되는지 확인
    expect(find.text('Test Movie'), findsOneWidget);
  });

  testWidgets('DonutChartPainter 렌더링 여부 확인', (WidgetTester tester) async {
    // Given: DonutChartPainter 데이터 준비
    const progress = 0.5;
    final displayText = StringFormatter.formatRating(progress);

    // When: CustomPaint 위젯에 DonutChartPainter 적용
    await tester.pumpWidget(
      CustomPaint(
        painter: DonutChartPainter(
          progress: progress,
          displayText: displayText,
        ),
        child: const SizedBox(width: 200, height: 200),
      ),
    );

    // Then: 위젯 트리가 제대로 렌더링되었는지 확인
    final customPaintFinder = find.byType(CustomPaint);
    expect(customPaintFinder, findsOneWidget);
  });

  test('DonutChartPainter의 shouldRepaint 정상 동작 여부 확인', () {
    // Given: DonutChartPainter 비교 데이터 준비
    const progressBefore = 0.5;
    final displayTextBefore = StringFormatter.formatRating(progressBefore);
    const progressAfter = 0.7;
    final displayTextAfter = StringFormatter.formatRating(progressAfter);

    // Given: DonutChartPainter 비교군 생성
    final originalPainter = DonutChartPainter(
      progress: progressBefore,
      displayText: displayTextBefore,
    );
    final newPainterSame = DonutChartPainter(
      progress: progressBefore,
      displayText: displayTextBefore,
    );
    final newPainterDifferent = DonutChartPainter(
      progress: progressAfter,
      displayText: displayTextAfter,
    );

    // Then: shouldRepaint 결과 확인
    expect(originalPainter.shouldRepaint(newPainterSame), isFalse);
    expect(originalPainter.shouldRepaint(newPainterDifferent), isTrue);
  });
}
