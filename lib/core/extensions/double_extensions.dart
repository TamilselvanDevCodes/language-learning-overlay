import 'package:flutter/material.dart';

extension DoubleExtensions on double? {
  /// Returns [this] if not null, else [fallback].
  double or(double fallback) => this ?? fallback;

  /// Converts to [int], safely handling null.
  int toIntOr(int fallback) => this?.toInt() ?? fallback;

  /// Returns `true` if the number is null or zero.
  bool get isNullOrZero => this == null || this == 0.0;

  /// Returns `true` if not null and greater than zero.
  bool get isPositive => (this ?? 0.0) > 0.0;

  /// Converts to a fixed decimal string safely.
  String toFixedOr(int fractionDigits, {double? fallback}) {
    final value = this ?? fallback ?? 0.0;
    return value.toStringAsFixed(fractionDigits);
  }

  /// Converts the value into a SizedBox of height = this.
  SizedBox get verticalSpace => SizedBox(height: this ?? 0.0);

  /// Converts the value into a SizedBox of width = this.
  SizedBox get horizontalSpace => SizedBox(width: this ?? 0.0);
}
