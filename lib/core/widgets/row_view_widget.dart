import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/theme_data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/widgets/app_text.dart';

/// Base row widget with left and right children
abstract class RowViewWidget extends StatelessWidget {
  final Widget left;
  final Widget right;
  final int leftFlex;
  final int rightFlex;

  const RowViewWidget({
    required this.left,
    required this.right,
    this.leftFlex = 1,
    this.rightFlex = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: leftFlex, child: left),
          Expanded(flex: rightFlex, child: right),
        ],
      ),
    );
  }
}

/// A row widget with a heading and a value widget
class FormFieldRowViewWidget extends RowViewWidget {
  final String heading;
  final TextStyle? headingStyle;
  final EdgeInsetsGeometry? headingPadding;
  final Color? headingBackgroundColor;
  final Widget valueWidget;

  FormFieldRowViewWidget({
    required this.heading,
    required this.valueWidget,
    this.headingStyle,
    this.headingPadding,
    this.headingBackgroundColor,
    super.leftFlex,
    super.rightFlex,
    super.key,
  }) : super(
    left: Container(
      alignment: Alignment.centerRight,
      padding: headingPadding ?? EdgeInsets.all(SizeConstants.s12),
      color: headingBackgroundColor ?? Colors.grey.shade300,
      child: AppText(
        heading,
        style: headingStyle ?? getTextStyle(),
      ),
    ),
    right: valueWidget,
  );
}
class DetailRowViewWidget extends RowViewWidget {
  final String heading;
  final String value;
  final TextStyle? headingStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? textPadding;
  final Color? headingBackgroundColor;
  final Color? valueBackgroundColor;

  DetailRowViewWidget({
    required this.heading,
    this.headingStyle,
    this.textPadding,
    required this.value,
    this.valueBackgroundColor,
    this.valueStyle,
    this.headingBackgroundColor,
    super.leftFlex,
    super.rightFlex,
    super.key,
  }) : super(
    left: Container(
      padding: textPadding ?? EdgeInsets.all(SizeConstants.s12),
      color: headingBackgroundColor,
      child: AppText(
        heading,
        style: headingStyle ?? getTextStyle(),
      ),
    ),
    right: Container(
      padding: textPadding ?? EdgeInsets.all(SizeConstants.s12),
      color: valueBackgroundColor,
      child: AppText(
        value,
        style: valueStyle ?? getTextStyle(),
      ),
    ),
  );
}