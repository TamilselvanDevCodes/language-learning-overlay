import 'dart:convert';

extension StringExtensions on String? {
  /// Returns a fallback string if null or empty
  String withFallback([String? fallBackText]) {
    if (this == null || this!.trim().isEmpty) return fallBackText ?? "-";
    return this!;
  }

  /// Case-insensitive comparison
  bool equalsIgnoreCase(String other) {
    if (this == null) return false;
    return this!.toLowerCase() == other.toLowerCase();
  }

  /// Checks if string is non-null and non-empty
  bool get isValidString {
    return this != null && this!.trim().isNotEmpty;
  }

  /// Capitalizes the first letter
  String? get initCap {
    if (!isValidString) return this;
    final trimmed = this!.trim();
    return trimmed[0].toUpperCase() + trimmed.substring(1).toLowerCase();
  }

  /// Checks if string is valid JSON
  bool get isValidJson {
    if (!isValidString) return false;
    try {
      jsonDecode(this!);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Converts string to snake_case
  String? toSnakeCase() {
    if (!isValidString) return this;
    final pattern = RegExp(r'[A-Z]');
    return this!.replaceAllMapped(pattern, (match) {
      final lower = match.group(0)!.toLowerCase();
      return match.start == 0 ? lower : '_$lower';
    }).replaceAll(' ', '_');
  }

  /// Converts string to camelCase
  String? toCamelCase() {
    if (!isValidString) return this;
    final parts = this!.split(RegExp(r'[_\s]'));
    return parts.first.toLowerCase() +
        parts.skip(1).map((e) => e.initCap).join();
  }

  /// Converts string to Title Case
  String? toTitleCase() {
    if (!isValidString) return this;
    return this!.split(' ').map((w) => w.initCap ?? '').join(' ');
  }

  /// Truncates string to specified length
  String? truncate(int length) {
    if (!isValidString) return this;
    return this!.length <= length ? this : this!.substring(0, length);
  }

  /// Reverses the string
  String? reverse() {
    if (!isValidString) return this;
    return this!.split('').reversed.join();
  }

  /// Checks if string is numeric
  bool get isNumeric {
    if (!isValidString) return false;
    return double.tryParse(this!.trim()) != null;
  }

  /// Case-insensitive contains
  bool containsIgnoreCase(String other) {
    if (!isValidString) return false;
    return this!.toLowerCase().contains(other.toLowerCase());
  }

  /// Removes extra spaces
  String? get removeExtraSpaces {
    if (!isValidString) return this;
    return this!.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Converts string to boolean
  bool? toBoolean() {
    if (!isValidString) return null;
    final v = this!.trim().toLowerCase();
    if (v == 'true') return true;
    if (v == 'false') return false;
    return null;
  }

  /// Converts string to int
  int? toInt() {
    if (!isValidString) return null;
    return int.tryParse(this!.trim());
  }

  /// Converts string to double
  double? toDouble() {
    if (!isValidString) return null;
    return double.tryParse(this!.trim());
  }

  /// Adds [prefix] to the start of the string
  String addFirst(String prefix, {bool ifNotEmpty = false}) {
    if (!isValidString) return prefix;
    if (ifNotEmpty && this!.trim().isEmpty) return this!;
    return '$prefix${this!}';
  }

  /// Adds [suffix] to the end of the string
  String addLast(String suffix, {bool ifNotEmpty = false}) {
    if (!isValidString) return suffix;
    if (ifNotEmpty && this!.trim().isEmpty) return this!;
    return '${this!}$suffix';
  }

  /// Surrounds the string with [left] and [right]
  String surround(String left, String right) {
    if (!isValidString) return '$left$right';
    return '$left${this!}$right';
  }
}
