import 'package:language_learning_overlay/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/extensions/boolean_extensions.dart';
import 'package:language_learning_overlay/core/extensions/string_extensions.dart';
import 'package:language_learning_overlay/core/widgets/app_text.dart';

import '../../../core/constants/size_constants.dart';
import '../../../core/theme_data/text_style.dart';
import '../theme_data/border_style.dart';

class DropDownFormTile<T> extends StatefulWidget {
  final List<T> dropDownItems;
  final TextEditingController controller;
  final bool? shouldDisableBorder;
  final String Function(dynamic) itemToString;
  final String? title;
  final void Function(T value)? onUpdated;
  final bool? shouldExpand;

  const DropDownFormTile({
    super.key,
    this.shouldDisableBorder,
    this.shouldExpand,
    required this.itemToString,
    required this.dropDownItems,
    required this.controller,
    this.onUpdated,
    required this.title,
  });

  @override
  State<DropDownFormTile> createState() => _DropDownFormTileState();
}

class _DropDownFormTileState<T> extends State<DropDownFormTile<T>> {
  @override
  void initState() {
    super.initState();

    if (widget.controller.text.isEmpty) {
      widget.controller.text = WordConstants.wSelect;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.dropDownItems.isNotEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isValidString)
            Padding(
              padding: EdgeInsets.all(SizeConstants.s8),
              child: RichText(
                text: TextSpan(
                  text: widget.title,
                  style: getTextStyle(),
                  children: [
                    const TextSpan(text: WordConstants.wEmptyString,),
                    TextSpan(
                      text: WordConstants.wMandatory,
                      style: getTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConstants.s12,
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
              style: getTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConstants.s16,
                color: widget.controller.text.equalsIgnoreCase(WordConstants.wSelect,)
                    ? ColorConstants.appGrey
                    : null,
              ),
              expands: widget.shouldExpand.isTrue,
              maxLines: widget.shouldExpand.isTrue ? null : 1,
              readOnly: true,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              onTap: () async {
                try {
                  final selected = await showSearchableDropdownDialog<T>(
                    context: context,
                    items: widget.dropDownItems,
                    itemToString: widget.itemToString,
                    title: widget.title,
                  );

                  if (selected != null) {
                    widget.controller.text = widget.itemToString(selected);
                    if (widget.onUpdated != null) {
                      widget.onUpdated!(selected);
                    }
                  }
                } catch (e, s) {
                  debugPrint("error in dropdown : $e");
                  debugPrint("Stack in dropdown : $s");
                }
              },
              decoration: InputDecoration(
                counterText: "",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                suffixIcon: Icon(
                  Icons.arrow_drop_down_outlined,
                ),
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
      ),
    );
  }
}

Future<T?> showSearchableDropdownDialog<T>({
  required BuildContext context,
  required List<T> items,
  required String Function(T) itemToString,
  String? title,
}) async {
  T? selectedValue;
  List<T> filteredItems = List<T>.from(items);
  final TextEditingController searchController = TextEditingController();

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            backgroundColor: ColorConstants.appWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConstants.s16),
            ),
            child: Container(
              padding: EdgeInsets.all(SizeConstants.s12),
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: SizeConstants.s8),
                      child: AppText(
                        title,
                        style: TextStyle(
                          fontSize: SizeConstants.s18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  TextFormField(
                    controller: searchController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'[^\w\s]')), // Deny emojis/special chars
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          searchController.clear();
                          setState(() {
                            filteredItems = List.from(items);
                          });
                        },
                      ),
                      hintText: "${WordConstants.wSearch}...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredItems = items
                            .where(
                              (element) => itemToString(element)
                                  .toLowerCase()
                                  .startsWith(
                                    value.toLowerCase(),
                                  ),
                            )
                            .toList();
                      });
                    },
                  ),
                  SizedBox(
                    height: SizeConstants.s12,
                  ),
                  Flexible(
                    child: filteredItems.isNotEmpty
                        ? ListView.builder(
                            itemCount: filteredItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = filteredItems[index];
                              return InkWell(
                                onTap: () {
                                  selectedValue = item;
                                  Navigator.of(context).pop(selectedValue);
                                },
                                child: Container(
                                    padding: EdgeInsets.all(
                                      SizeConstants.s12,
                                    ),
                                    child: AppText(
                                      itemToString(item),
                                    )),
                              );
                            },
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConstants.s12,
                              vertical: SizeConstants.s26,
                            ),
                            child: AppText(
                              WordConstants.wNoDataFoundMessage,
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConstants.s8,
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const AppText(WordConstants.wCancel,),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );

  return selectedValue;
}
