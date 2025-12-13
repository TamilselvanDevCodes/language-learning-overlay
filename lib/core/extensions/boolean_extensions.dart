extension BoolExtensions on bool? {
  /// Returns `true` if the boolean is true, otherwise false.
  bool get isTrue => this == true;

  /// Returns `true` if the boolean is false or null.
  bool get isFalse => this == false || this == null;

  /// Returns the opposite of the boolean; null is treated as false.
  bool get toggle => !(this ?? false);

  /// Returns a value based on the boolean, else default.
  T valueOrDefault<T>(T trueValue, T falseValue) {
    if (this == true) return trueValue;
    return falseValue;
  }

  /// Returns the boolean as an integer (1 for true, 0 for false or null)
  int get asInt => this == true ? 1 : 0;

  /// Executes a function if the boolean is true
  void ifTrue(void Function() action) {
    if (this == true) action();
  }

  /// Executes a function if the boolean is false
  void ifFalse(void Function() action) {
    if (this != true) action();
  }
}