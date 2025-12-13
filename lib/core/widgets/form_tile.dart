import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/extensions/boolean_extensions.dart';
import 'package:language_learning_overlay/core/extensions/string_extensions.dart';
import 'package:language_learning_overlay/core/theme/border_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_overlay/core/utils/date_formatter.dart';

import '../constants/pattern_constants.dart';
import '../constants/word_constants.dart';
import '../theme/text_style.dart';

class FormTile extends StatefulWidget {
  final String? title;
  final bool? isMandatory;
  final bool? shouldDisableBorder;
  final bool? shouldExpand;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final bool? isLarge;
  final InputFormat? inputFormat;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isDateTimePicker;
  final TextInputAction? textInputAction;

  @override
  State<FormTile> createState() => _FormTileState();

  const FormTile(
      {super.key,
      required this.title,
      this.isMandatory,
      this.shouldDisableBorder,
      this.shouldExpand,
      this.suffixIcon,
      this.isDateTimePicker,
      this.isLarge,
      this.validator,
      this.isObscureText,
      required this.controller,
      this.textInputAction,
      this.inputFormat});
}

class _FormTileState extends State<FormTile> {
  List<FilteringTextInputFormatter> filedInputFormatters = [];

  @override
  void initState() {
    initialize();

    super.initState();
  }

  void initialize() async {
    getInputFormat(widget.inputFormat);
    if (widget.isDateTimePicker != null && widget.isDateTimePicker!) {
      widget.controller.text = DateFormatter.formatDate(DateTime.now());
    }
  }

  TextInputType getKeyBoardType() {
    if (widget.inputFormat == null) {
      return TextInputType.text;
    } else if (widget.inputFormat == InputFormat.email) {
      return TextInputType.emailAddress;
    } else if (widget.inputFormat == InputFormat.password) {
      return TextInputType.visiblePassword;
    } else if (widget.inputFormat == InputFormat.phone) {
      return TextInputType.phone;
    } else if (widget.inputFormat == InputFormat.address) {
      return TextInputType.streetAddress;
    } else if (widget.inputFormat == InputFormat.emailAndPhone) {
      return TextInputType.emailAddress;
    } else {
      return TextInputType.text;
    }
  }

  void getInputFormat(InputFormat? inputFormat) {
    filedInputFormatters.clear(); // Clear previous formatters

    // Deny emojis first
    filedInputFormatters.add(
      FilteringTextInputFormatter.deny(
        RegExp(PatternConstants.patternToRemoveEmoji),
      ),
    );

    if (inputFormat == null) {
      return;
    }

    switch (inputFormat) {
      case InputFormat.phone:
        filedInputFormatters.add(
          FilteringTextInputFormatter.allow(RegExp(
              PatternConstants.patternForMobile)), // Allows numbers and +
        );
        break;

      case InputFormat.email:
        filedInputFormatters.add(
          FilteringTextInputFormatter.allow(RegExp(
              PatternConstants.patternForEmail)), // Allows email characters
        );
        break;

      case InputFormat.name:
        filedInputFormatters.add(
          FilteringTextInputFormatter.allow(RegExp(PatternConstants
              .patternForStringOnly)), // Allows letters and spaces
        );
        break;
      case InputFormat.nameAndNumber:
        filedInputFormatters.add(
          FilteringTextInputFormatter.allow(
            RegExp(
              PatternConstants.patternForStringAndNumbers,
            ),
          ),
        );
        break;
      case InputFormat.password:
      case InputFormat.emailAndPhone:
        // No specific filter for password and emailAndPhone, allowing all characters
        break;

      case InputFormat.address:
        filedInputFormatters.add(
          FilteringTextInputFormatter.allow(RegExp(
              r'[a-zA-Z0-9\s,.-]')), // Allows letters, numbers, spaces, commas, dots, and hyphens
        );
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: widget.shouldExpand.isTrue
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      spacing: SizeConstants.s2,
      children: [
        if (widget.title.isValidString)
          Padding(
            padding: EdgeInsets.all(SizeConstants.s8),
            child: RichText(
              text: TextSpan(
                text: widget.title,
                style: getTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConstants.s18,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: WordConstants.wEmptyString,
                  ),
                  if (widget.isMandatory != null && widget.isMandatory!)
                    TextSpan(
                      text: WordConstants.wMandatory,
                      style: getTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConstants.s16,
                        color: Colors.red.shade500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        Flexible(
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isObscureText ?? false,
            inputFormatters: filedInputFormatters,
            style: getTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SizeConstants.s18,
            ),
            expands: widget.shouldExpand.isTrue,
            keyboardType: getKeyBoardType(),
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            readOnly:
                widget.isDateTimePicker != null && widget.isDateTimePicker!,
            onTap: widget.isDateTimePicker != null && widget.isDateTimePicker!
                ? () async {
                  _handleDatePicker();
                  }
                : null,
            maxLines: widget.shouldExpand.isTrue
                ? null
                : widget.isLarge != null && widget.isLarge!
                    ? 3
                    : 1,
            validator: widget.validator,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              counterText: "",
              // labelText: widget.title,
              // hintText: widget.title,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon: widget.suffixIcon ??
                  (widget.shouldExpand.isTrue
                      ? null
                      : ValueListenableBuilder<TextEditingValue>(
                          valueListenable: widget.controller,
                          builder: (context, value, child) {
                            return value.text.length > 20
                                ? IconButton(
                                    onPressed: () {
                                      widget.controller.clear();
                                    },
                                    icon: const Icon(Icons.clear_outlined),
                                  )
                                : const SizedBox
                                    .shrink(); // Ensures layout remains stable
                          },
                        )),
              border: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getBorder(),
              enabledBorder: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getEnabledBorder(),
              disabledBorder: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getDisabledBorder(),
              errorBorder: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getErrorBorder(),
              focusedBorder: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getFocusedBorder(),
              focusedErrorBorder: widget.shouldDisableBorder.isTrue
                  ? MyBorderStyle.transparentBorder
                  : MyBorderStyle.getFocusedErrorBorder(),
            ).applyDefaults(
              Theme.of(context).inputDecorationTheme,
            ),
          ),
        ),
      ],
    );
  }
  Future<void> _handleDatePicker() async {
    final dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      currentDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (dateTime != null) {
      widget.controller.text = DateFormatter.formatDate(dateTime);
    }
  }
}

enum InputFormat {
  phone,
  email,
  name,
  password,
  address,
  emailAndPhone,
  nameAndNumber
}
