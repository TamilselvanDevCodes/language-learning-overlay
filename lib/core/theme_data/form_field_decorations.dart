import 'package:language_learning_overlay/core/theme_data/text_style.dart';
import 'package:flutter/material.dart';

import '../constants/size_constants.dart';
import 'border_style.dart';

sealed class MyInputDecorationThemeData {
  static InputDecorationTheme getLightMode() {
    return InputDecorationTheme(
      activeIndicatorBorder: MyBorderStyle.getActiveIndicatorBorder(),
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.all(
        SizeConstants.s12,
      ),
      border: MyBorderStyle.getBorder(),
      enabledBorder: MyBorderStyle.getEnabledBorder(),
      disabledBorder: MyBorderStyle.getDisabledBorder(),
      errorBorder: MyBorderStyle.getErrorBorder(),
      focusedBorder: MyBorderStyle.getFocusedBorder(),
      focusedErrorBorder: MyBorderStyle.getFocusedErrorBorder(),
      errorMaxLines: 2,
      errorStyle: MyTextStyle.getErrorTextStyle(),
      helperMaxLines: 1,
      floatingLabelStyle: MyTextStyle.getFloatingLabelTextStyle(),
      helperStyle: MyTextStyle.getHelperTextStyle(),
      hintStyle: MyTextStyle.getHintTextStyle(),
      labelStyle: MyTextStyle.getLabelTextStyle(),
      outlineBorder: MyBorderStyle.getOutlinedBorder(),
      prefixStyle: MyTextStyle.getPrefixTextStyle(),
      suffixStyle: MyTextStyle.getSuffixTextStyle(),
      counterStyle: MyTextStyle.getCounterTextStyle(),
    );
  }
}
