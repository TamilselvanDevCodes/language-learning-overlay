
extension NullableIntExtensions on int? {
  /// Returns [this] if not null, else [fallback].
  int or(int? fallback) => this ?? fallback??0;

  /// Converts to [double], safely handling null.
  double toDoubleOr(double? fallback) => this?.toDouble() ?? fallback??0.0;

  /// Returns `true` if the number is null or zero.
  bool get isNullOrZero => this == null || this == 0;

  /// Returns `true` if not null and greater than zero.
  bool get isPositive => (this ?? 0) > 0;
}