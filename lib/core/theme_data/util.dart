import 'package:language_learning_overlay/core/theme_data/theme.dart';
import 'package:flutter/material.dart';

Color getStateColorForElevatedButton(Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return Colors.white70;
  }
  return Colors.white;
}
Color getStateColorForOutlinedButton(Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return myThemeColor.shade800;
  }
  return myThemeColor.shade600;
}
