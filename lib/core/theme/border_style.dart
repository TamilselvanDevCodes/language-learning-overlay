import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/color_constants.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/theme/style_constant.dart';

sealed class MyBorderStyle {
  static final transparentBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  );

  static const double radius = SizeConstants.s12;

  static BorderSide getActiveIndicatorBorder() {
    return getBorderSide(color: ColorConstants.formFieldBorder);
  }

  static InputBorder getBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: ColorConstants.formFieldBorder),
    );
  }

  static InputBorder getEnabledBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: ColorConstants.formFieldBorder),
    );
  }

  static InputBorder getDisabledBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: ColorConstants.formFieldBorder),
    );
  }

  static InputBorder getErrorBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: Colors.red.shade500,),
    );
  }

  static InputBorder getFocusedBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: ColorConstants.formFieldBorder),
    );
  }

  static InputBorder getFocusedErrorBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(radius: radius ?? MyBorderStyle.radius),
      borderSide: getBorderSide(color: Colors.red.shade800),
    );
  }

  static BorderSide getOutlinedBorder() {
    return getBorderSide(color: ColorConstants.formFieldBorder);
  }
}

BorderRadius getBorderRadius({double? radius}) {
  return BorderRadius.circular(radius ?? SizeConstants.s6);
}

BorderSide getBorderSide({required Color color, double? width}) {
  return BorderSide(
    color: color,
    width: width ?? StyleConstant.thickness,
    style: BorderStyle.solid,
  );
}
