import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/theme/theme.dart';
import 'package:flutter/material.dart';

sealed class MyTextStyle {
  static const MaterialColor _color = Colors.grey;

  static TextStyle getErrorTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s12,
      color: Colors.red.shade500,
    );
  }

  static TextStyle getFloatingLabelTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s14,
      color: _color,
    );
  }

  static TextStyle getHelperTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s12,
      color: myThemeColor.shade300,
    );
  }

  static TextStyle getHintTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s14,
      color: _color,
    );
  }

  static TextStyle getLabelTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s14,
    );
  }

  static TextStyle getPrefixTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s14,
    );
  }

  static TextStyle getSuffixTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s14,
    );
  }

  static TextStyle getCounterTextStyle() {
    return getTextStyle(
      fontWeight: FontWeight.w400,
      fontSize: SizeConstants.s10,
    );
  }
}

sealed class MyFontWeight {
  static const FontWeight headLine = FontWeight.w700;
  static const FontWeight title = FontWeight.w600;
  static const FontWeight body = FontWeight.w400;
  static const FontWeight label = FontWeight.w400;
}

interface class MyFontSize {

  static final MyFontSize _instance = MyFontSize._internal();

  factory MyFontSize() {
    return _instance;
  }


  MyFontSize._internal();



  // Font sizes
  static double mainSize = SizeConstants.s14;
  static double sizeSmall = mainSize;
  static double sizeMedium = sizeSmall + SizeConstants.s6;
  static double sizeLarge = sizeSmall + SizeConstants.s10;
  static double letterSpacing = 0;
  static double height = mainSize * 0.1;
}




TextStyle getTextStyle({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
  Color? color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: MyFontSize.letterSpacing,
    height: MyFontSize.height,
    leadingDistribution: TextLeadingDistribution.proportional,
  );
}
