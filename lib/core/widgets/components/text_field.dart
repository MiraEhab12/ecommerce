import 'dart:ui';

import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;

  final TextEditingController? controller;
  final bool isEnable;

  final bool obscureText;
  final bool disableBorder;
  final bool disableFocusBorder;
  final bool isMultiLine;
  final bool readOnly;
  final TextInputType keyboardType;

  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon;
  final Widget? fixIcon;
  final Widget? trailingLabel;

  final double radius;
  final double? height;

  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit, onChanged;
  final List<TextInputFormatter> inputFormatter;
  final TextDirection? textDirection;

  const AppTextField({
    super.key,
    this.inputFormatter = const [],
    this.radius = 8,
    this.keyboardType = TextInputType.text,
    this.isEnable = true,
    this.obscureText = false,
    this.readOnly = false,
    this.disableBorder = false,
    this.disableFocusBorder = false,
    this.controller,
    this.validator,
    this.onTap,
    this.icon,
    this.fixIcon,
    this.onChanged,
    this.textAlign,
    this.contentPadding,
    this.onSubmit,
    this.labelText = '',
    this.hintText = '',
    this.textDirection,
    this.isMultiLine = false,
    this.height,
    this.trailingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (trailingLabel != null) trailingLabel!,
            if (labelText != null)
              Expanded(
                child: Text(
                  labelText ?? "",
                  style: AppTextStyle.font14black2400,
                ),
              ),
          ],
        ),
        4.hs,
        SizedBox(
          height: isMultiLine ? height?.h ?? 150.h : null,
          child: TextFormField(
            cursorColor: AppColors.black,
            onTap: onTap,
            expands: isMultiLine,
            readOnly: readOnly,
            maxLines: isMultiLine ? null : 1,
            inputFormatters: inputFormatter,
            onFieldSubmitted: onSubmit,
            textAlignVertical: isMultiLine ? TextAlignVertical.top : null,
            onChanged: onChanged,
            enabled: isEnable,
            keyboardType: isMultiLine ? TextInputType.multiline : keyboardType,
            textAlign: textAlign ?? TextAlign.start,
            controller: controller,
            textDirection: textDirection,
            obscureText: obscureText,
            validator: validator,
            style: AppTextStyle.font14black2400,
            decoration: InputDecoration(
             // hintStyle: AppTextStyle.font14black500,
              labelStyle: AppTextStyle.font14black2400,
              filled: true,
              fillColor: AppColors.white,
              suffixIcon: fixIcon,
              hintText: hintText,
              border: disableBorder
                  ? null
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: AppColors.grey, width: 1),
                    ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors.error),
              ),
              enabled: true,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors.error),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
