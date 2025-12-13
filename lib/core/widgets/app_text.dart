import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/theme/text_style.dart';

/// A custom replacement for the default [Text] widget.
/// 
/// Supports:
/// - Default text style
/// - Optional custom style
/// - Text alignment
/// - Max lines and overflow handling
/// - Easy future support for localization
class AppText extends StatelessWidget {
  /// The string to display.
  final String text;

  /// Optional style to override default text style.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// Max number of lines for the text.
  final int? maxLines;

  /// What happens when text overflows.
  final TextOverflow overflow;

  /// Optional line height.
  final double? lineHeight;



  /// Constructor
  const AppText(
      this.text, {
        super.key,
        this.style,
        this.textAlign = TextAlign.start,
        this.maxLines,
        this.overflow = TextOverflow.ellipsis,
        this.lineHeight,
      });

  @override
  Widget build(BuildContext context) {
    // ignore: no_text_widget
    return Text(
      text,
      style: style??getTextStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
