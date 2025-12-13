import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/theme_data/text_style.dart';

import 'app_text.dart';

sealed class AppBars {
  static AppBar getAppBar({
    required String title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
  }) {
    return AppBar(
      title: AppText(
        title,
        style: getTextStyle(
          fontWeight: FontWeight.w600,
          fontSize: SizeConstants.s20,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: actions,
      bottom: bottom,
    );
  }
}
