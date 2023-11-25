import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/app/theme/app_theme.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
    this.text, {
    this.color = AppColor.primaryText,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.maxLines = 2,
    super.key,
  });

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: AppTheme.defaultFont.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    );
  }
}
