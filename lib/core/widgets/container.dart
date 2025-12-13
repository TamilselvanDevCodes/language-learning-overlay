import 'package:language_learning_overlay/core/extensions/string_extensions.dart';
import 'package:language_learning_overlay/core/theme_data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/widgets/app_text.dart';

import '../constants/color_constants.dart';
import '../constants/size_constants.dart';

class AppContainer extends StatelessWidget {
  final bool isBorderEnabled;
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double? height;
  final double? width;

  const AppContainer({
    super.key,
    this.isBorderEnabled = false,
    required this.child,
    this.padding,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConstants.s8,),
        color: color ?? ColorConstants.appWhite,
        border: isBorderEnabled
            ? Border.all(
          color: ColorConstants.appGrey,
          width: SizeConstants.s1,
        )
            : null,
      ),
      child: child,
    );
  }
}


class GetConstrainedContainer extends StatelessWidget {
  final BorderType borderType;
  final MaterialColor? color;
  final String? text;

  const GetConstrainedContainer({
    this.borderType = BorderType.allSides,
    this.color,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConstants.s6,
              vertical: SizeConstants.s2,
            ),
            decoration: BoxDecoration(
              color: color?.shade100,
              borderRadius: _getBorderRadius(borderType),
            ),
            child: AppText(
              text.withFallback(),
              style: getTextStyle(
                color: color?.shade800,
                fontSize: SizeConstants.s14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  BorderRadius? _getBorderRadius(BorderType borderType) {
    switch (borderType) {
      case BorderType.allSides:
        return BorderRadius.circular(SizeConstants.s8);
      case BorderType.bottomLeftDiagonal:
        return BorderRadius.only(
          bottomLeft: Radius.circular(SizeConstants.s8),
          topRight: Radius.circular(SizeConstants.s8),
        );
      case BorderType.topLeftDiagonal:
        return BorderRadius.only(
          topLeft: Radius.circular(SizeConstants.s8),
          bottomRight: Radius.circular(SizeConstants.s8),
        );
      case BorderType.noBorder:
        return BorderRadius.zero;
    }
  }
}

class ContainerButton extends StatelessWidget {
  final Widget child;
  final bool isBorderEnabled;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double borderRadius;
  final Color borderColor;

  const ContainerButton({
    super.key,
    required this.child,
    required this.onTap,
    this.isBorderEnabled = true,
    this.padding,
    this.backgroundColor = ColorConstants.appWhite,
    this.borderRadius = SizeConstants.s8,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.all(SizeConstants.s8),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: isBorderEnabled ? Border.all(color: borderColor) : null,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}


enum BorderType {
  bottomLeftDiagonal,
  topLeftDiagonal,
  allSides,
  noBorder,
}




