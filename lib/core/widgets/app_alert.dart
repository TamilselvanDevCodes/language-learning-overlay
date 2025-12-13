import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/theme_data/text_style.dart';
import 'package:language_learning_overlay/core/theme_data/theme.dart';
import 'package:language_learning_overlay/core/utils/global_variables.dart';
import 'package:language_learning_overlay/core/extensions/string_extensions.dart';

import 'app_text.dart';

enum AlertAction { yes, no, ok, cancel }

class AppAlert {
  AppAlert._();

  static BuildContext get _context => navigatorKey.currentContext!;

  static NavigatorState? get _nav => navigatorKey.currentState;

  static ScaffoldMessengerState? get _snack => snackBarKey.currentState;

  static BorderRadius get _dialogRadius =>
      BorderRadius.circular(SizeConstants.s16);
  static bool isLoading = false;

  static void showProgressDialog() {
    if (isLoading) {
      return;
    }
    isLoading = true;
    showDialog(
      context: _context,
      barrierDismissible: false,
      barrierColor: Colors.black38,
      builder: (_) => const _LoadingDialog(),
    );
  }

  static void hideLoadingDialog() {
    if (!isLoading) {
      return;
    }
    isLoading = false;
    _nav?.pop();
  }
  static void showCustomSnackBar({required String content}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_snack == null) return;
    _snack!.clearSnackBars();
    _snack!.showSnackBar(
      SnackBar(
        content: AppText(
          content.withFallback(),
          style: getTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: SizeConstants.s18,
          ),
        ),
      ),
    );
  }

  static Widget _buildDialogContent({
    required String title,
    String? description,
    Widget? image,
    Widget? extra,
    List<Widget>? actions,
  }) {
    return Container(
      padding: EdgeInsets.all(SizeConstants.s16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: _dialogRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SizeConstants.s12,
        children: [
          if (image != null) image,
          AppText(
            title.withFallback(),
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SizeConstants.s20,
            ),
          ),
          if (description.isValidString)
            AppText(
              description!,
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConstants.s16,
                color: Colors.black54,
              ),
            ),
          if (extra != null) extra,
          if (actions != null) ...actions,
        ],
      ),
    );
  }

  static Future<AlertAction> _showDialogBase(Widget dialog) async {
    final result = await showDialog<AlertAction>(
      context: _context,
      barrierDismissible: false,
      builder: (_) => PopScope(canPop: false, child: dialog),
    );
    return result ?? AlertAction.cancel;
  }

  // ===========================
  // PERMISSION DIALOG
  // ===========================

  static Future<AlertAction> showPermissionDialog(
    IconData icon, {
    required String message,
    String? description,
  }) async {
    return _showDialogBase(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: _dialogRadius),
        backgroundColor: Colors.transparent,
        child: _buildDialogContent(
          title: message,
          description: description,
          image: Container(
            decoration: BoxDecoration(
              color: myThemeColor.shade100,
              borderRadius: BorderRadius.circular(SizeConstants.s8),
            ),
            width: SizeConstants.s72,
            height: SizeConstants.s72,
            child: Icon(icon, size: SizeConstants.s40),
          ),
          actions: [
            _buildButtonRow(
              leftLabel: WordConstants.wCancel,
              rightLabel: WordConstants.wYes,
              leftAction: () => _nav?.pop(AlertAction.no),
              rightAction: () => _nav?.pop(AlertAction.yes),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================
  // OK DIALOG (with optional image)
  // ===========================

  static Future<AlertAction> showCustomDialogOK({
    required String message,
    String? description,
    required String imageConstant,
    Widget? subDescriptionWidget,
    VoidCallback? onPressedOK,
  }) async {
    final image = imageConstant.isValidString
        ? Padding(
            padding: EdgeInsets.all(SizeConstants.s12),
            child: Image.asset(
              imageConstant,
              width: SizeConstants.s72,
              height: SizeConstants.s72,
            ),
          )
        : null;

    return _showDialogBase(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: _dialogRadius),
        backgroundColor: Colors.transparent,
        child: _buildDialogContent(
          title: message,
          description: description,
          image: image,
          extra: subDescriptionWidget,
          actions: [
            ElevatedButton(
              onPressed: onPressedOK ?? () => _nav?.pop(AlertAction.ok),
              child: AppText(WordConstants.wOK),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================
  // SIMPLE OK DIALOG
  // ===========================

  static Future<AlertAction> showSimpleDialogOK({
    required String message,
    String? description,
    Widget? subDescriptionWidget,
  }) async {
    return _showDialogBase(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: _dialogRadius),
        backgroundColor: Colors.transparent,
        child: _buildDialogContent(
          title: message,
          description: description,
          extra: subDescriptionWidget,
          actions: [
            ElevatedButton(
              onPressed: () => _nav?.pop(AlertAction.ok),
              child: AppText(WordConstants.wOK),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================
  // LOGOUT / YES-NO DIALOG
  // ===========================

  static Future<AlertAction> showYesNoDialog({
    required String title,
    required String message,
    String leftLabel = WordConstants.wCancel,
    String rightLabel = WordConstants.wYes,
  }) async {
    return _showDialogBase(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: _dialogRadius),
        backgroundColor: Colors.transparent,
        child: _buildDialogContent(
          title: title,
          description: message,
          actions: [
            _buildButtonRow(
              leftLabel: leftLabel,
              rightLabel: rightLabel,
              leftAction: () => _nav?.pop(AlertAction.no),
              rightAction: () => _nav?.pop(AlertAction.yes),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================
  // COMMON REUSABLE BUTTON ROW
  // ===========================

  static Widget _buildButtonRow({
    required String leftLabel,
    required String rightLabel,
    required VoidCallback leftAction,
    required VoidCallback rightAction,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: SizeConstants.s8,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: leftAction,
              child: AppText(leftLabel),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: rightAction,
              child: AppText(rightLabel),
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================
// SEPARATE PRIVATE WIDGETS
// ===========================

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(SizeConstants.s20),
          ),
          padding: EdgeInsets.all(SizeConstants.s16),
          height: SizeConstants.s80,
          width: SizeConstants.s80,
          child: CircularProgressIndicator(
            strokeWidth: SizeConstants.s6,
            color: myThemeColor,
          ),
        ),
      ),
    );
  }
}
