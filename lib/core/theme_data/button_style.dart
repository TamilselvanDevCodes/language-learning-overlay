import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/theme_data/text_style.dart';
import 'package:language_learning_overlay/core/theme_data/theme.dart';
import 'package:language_learning_overlay/core/theme_data/util.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'border_style.dart';

sealed class MyButtonStyle {

  static ElevatedButtonThemeData getElevatedButtonThemeData() =>
      ElevatedButtonThemeData(style: getElevatedButtonStyle());

  static OutlinedButtonThemeData getOutlinedButtonThemeData() =>
      OutlinedButtonThemeData(style: getOutlinedButtonStyle());

  static TextButtonThemeData getTextButtonThemeData({double? minWidth}) =>
      TextButtonThemeData(style: getTextButtonStyle(minWidth: minWidth));

  // ==========================
  // BUTTON STYLES
  // ==========================
  static ButtonStyle getElevatedButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 200),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) => states.contains(WidgetState.pressed) ? 1 : 2,
      ),
      foregroundColor:
      WidgetStateProperty.resolveWith(getStateColorForElevatedButton),
      iconColor:
      WidgetStateProperty.resolveWith(getStateColorForElevatedButton),
      iconSize: WidgetStateProperty.all(MyFontSize.mainSize),
      padding: WidgetStateProperty.all(
        EdgeInsets.all(SizeConstants.s8),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: getBorderRadius()),
      ),
      visualDensity: VisualDensity.comfortable,
      side: WidgetStateProperty.resolveWith<BorderSide>(
            (states) => states.contains(WidgetState.pressed)
            ? getBorderSide(color: myThemeColor)
            : getBorderSide(color: myThemeColor.shade500),
      ),
      textStyle: WidgetStatePropertyAll(
        getTextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SizeConstants.s16,
        ),
      ),
      backgroundColor: WidgetStateProperty.all(myThemeColor.shade500),
    );
  }

  static ButtonStyle getOutlinedButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 200),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) => states.contains(WidgetState.pressed) ? 1 : 2,
      ),
      foregroundColor:
      WidgetStateProperty.resolveWith(getStateColorForOutlinedButton),
      iconColor:
      WidgetStateProperty.resolveWith(getStateColorForOutlinedButton),
      iconSize: WidgetStateProperty.all(MyFontSize.mainSize),
      padding: WidgetStateProperty.all(
        EdgeInsets.all(SizeConstants.s12),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: getBorderRadius()),
      ),
      surfaceTintColor: WidgetStateProperty.all(myThemeColor.shade200),
      visualDensity: VisualDensity.comfortable,
      textStyle: WidgetStatePropertyAll(
        getTextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SizeConstants.s16,
        ),
      ),
      side: WidgetStateProperty.all(
        getBorderSide(color: myThemeColor.shade600, width: 1),
      ),
    );
  }

  static ButtonStyle getTextButtonStyle({double? minWidth}) {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 200),
      iconSize: WidgetStateProperty.all(MyFontSize.mainSize),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          vertical: SizeConstants.s8,
          horizontal: SizeConstants.s12,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: getBorderRadius()),
      ),
      textStyle: WidgetStatePropertyAll(
        getTextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SizeConstants.s18,
        ),
      ),
      overlayColor: WidgetStateProperty.all(myThemeColor.shade50),
    );
  }
}
