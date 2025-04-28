import 'package:flutter_test/flutter_test.dart';
import 'package:movie_peek/utils/string_formatter.dart';

void main() {
  group('StringFormatter Tests', () {
    test('0.0 값을 입력 시 "★ 0/10" 반환 여부 확인', () {
      const value = 0.0;
      final result = StringFormatter.formatRating(value);
      expect(result, '★ 0/10');
    });

    test('0.7 값을 입력 시 "★ 7/10" 반환 여부 확인', () {
      const value = 0.7;
      final result = StringFormatter.formatRating(value);
      expect(result, '★ 7/10');
    });

    test('0.123 값 입력 시 "★ 1/10" 반환 여부 확인', () {
      const value = 0.123;
      final result = StringFormatter.formatRating(value);
      expect(result, '★ 1/10');
    });

    test('-0.5 값 입력 시 "★ 0/10"을 반환 여부 확인', () {
      const value = -0.5;
      final result = StringFormatter.formatRating(value);
      expect(result, '★ 0/10');
    });
  });
}
