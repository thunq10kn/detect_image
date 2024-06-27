import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/error_message.dart';
import 'package:rem_admin/src/common/utils/logger.dart';
import 'package:rem_admin/src/widgets/state_builder.dart';

import '../common/extension/text_input_formater_ext.dart';

class TextFormFieldRem extends StatelessWidget {
  TextFormFieldRem({
    super.key,
    this.title,
    this.maxLength,
    this.initialValue,
    this.maxLine = 1,
    this.controller,
    this.hintText,
    this.titleError,
    this.isNumber = false,
    this.isPhoneNumber = false,
    this.isShowMaxLength = true,
    this.isUpperCase = false,
    this.isErrorRightContent = false,
    this.isRequire = false,
    this.messageError,
    this.onChange,
    this.width,
    this.height,
    this.unit,
    this.border,
  });

  final BoxBorder? border;
  final String? hintText;
  final String? initialValue;
  final String? title;
  final String? titleError;
  final int? maxLength;
  final int? maxLine;
  final double? width;
  final double? height;
  final bool? isNumber;
  final bool? isErrorRightContent;
  final bool? isPhoneNumber;
  final bool? isShowMaxLength;
  final bool? isUpperCase;
  final bool? isRequire;
  final String? unit;
  final String? messageError;
  String errorText = "";
  final TextEditingController? controller;
  final Function(String value)? onChange;
  final StateHandler _stateHandler = StateHandler("TextFormFieldRem");
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.customColor18),
              ),
            if (title != null) const Gap(30),
            if (unit != null)
              Container(
                height: height,
                width: width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    border: border ??
                        Border.all(color: AppColors.customColor21, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  initialValue: initialValue,
                  onChanged: (value) {
                    currentIndex = value.trim().length;
                    onChange?.call(value.trim());
                    _stateHandler.refresh();
                  },
                  controller: controller,
                  maxLength: maxLength,
                  maxLines: maxLine,
                  inputFormatters: [
                    if (isNumber == true) ...[
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        final text = newValue.text;
                        return text.isEmpty
                            ? newValue
                            : double.tryParse(text) == null
                                ? oldValue
                                : newValue;
                      }),
                    ],
                    if (isPhoneNumber == true)
                      FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
                    if (isUpperCase == true) UpperCaseTextFormatter(),
                  ],
                  validator: (value) {
                    if ((value == null || value.isEmpty == true) &&
                        titleError != null) {
                      errorText = "$titleErrorは必須入力項目です。";
                    } else if (messageError != null) {
                      errorText = messageError!;
                    } else {
                      errorText = "";
                    }
                    _stateHandler.refresh();
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: hintText ?? '',
                      hintStyle: TextStyle(
                          color: AppColors.customColor22, fontSize: 12)),
                ),
              ),
            if (unit == null)
              Expanded(
                  child: Container(
                height: height,
                width: width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    border: border ??
                        Border.all(color: AppColors.customColor21, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (value) {
                    currentIndex = value.length;
                    onChange?.call(value);
                    _stateHandler.refresh();
                  },
                  initialValue: initialValue,
                  controller: controller,
                  maxLength: maxLength,
                  maxLines: maxLine,
                  inputFormatters: [
                    if (isNumber == true)
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    if (isPhoneNumber == true)
                      FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
                  ],
                  validator: (value) {
                    if ((value == null || value.isEmpty == true) &&
                        titleError != null) {
                      errorText = "$titleErrorは必須入力項目です。";
                    } else if (messageError != null) {
                      errorText = messageError!;
                    } else {
                      errorText = "";
                    }
                    _stateHandler.refresh();
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: hintText ?? '',
                      hintStyle: TextStyle(
                          color: AppColors.customColor22, fontSize: 12)),
                ),
              )),
            if (unit != null) const Gap(10),
            if (unit != null)
              Text(
                unit ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.customColor8),
              ),
            if (isErrorRightContent == true)
              StateBuilder(
                  builder: () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          if (unit != null &&
                              (isRequire == true || messageError != null))
                            Text(
                              errorText,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.redAccent),
                            ),
                        ],
                      ),
                  routeName: "TextFormFieldRem")
          ],
        ),
        // if (maxLength != null && isShowMaxLength == true) const Gap(9),
        if (isErrorRightContent == false)
          StateBuilder(
              builder: () => Column(
                    children: [
                      if ((maxLength != null && isShowMaxLength == true) ||
                          errorText.isNotEmpty == true)
                        const Gap(9),
                      Row(
                        mainAxisAlignment:
                            (isRequire == true || messageError != null)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null) const Gap(50),
                          const Gap(5),
                          if (unit == null &&
                              (isRequire == true || messageError != null))
                            Expanded(
                                child: Text(
                              errorText,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.redAccent),
                            )),
                          if (unit != null &&
                              (isRequire == true || messageError != null))
                            Text(
                              errorText,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.redAccent),
                            ),
                          if (maxLength != null && isShowMaxLength == true)
                            StateBuilder(
                                builder: () => Text(
                                      "($currentIndex/$maxLength文字)",
                                      style: TextStyle(
                                          color: AppColors.customColor8,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600),
                                    ),
                                routeName: "TextFormFieldTenKn")
                        ],
                      ),
                    ],
                  ),
              routeName: "TextFormFieldRem"),
      ],
    );
  }
}
