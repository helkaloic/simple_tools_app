// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_tools_app/src/app/resources/assets.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/app/theme/app_theme.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key,
    required this.onChanged,
    this.textInputType = TextInputType.text,
    this.hintText = '',
  });

  final Function(String value) onChanged;
  final TextInputType textInputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.defaultFont.copyWith(
          color: AppColor.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(
            color: AppColor.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(
            color: AppColor.accent,
            width: 2,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: SvgPicture.asset(
            AppSvg.search,
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
