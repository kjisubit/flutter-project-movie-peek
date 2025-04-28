
class StringFormatter {
  /// [value]: 0.0 ~ 1.0 범위의 값을 받아서 평가 점수 형식으로 반환
  /// 예: 0.7 -> "★ 7/10"
  static String formatRating(double value) {
    final clampedValue = value.clamp(0.0, 1.0);
    final scaledValue = (clampedValue * 10).toStringAsFixed(0);
    return '★ $scaledValue/10';
  }
}