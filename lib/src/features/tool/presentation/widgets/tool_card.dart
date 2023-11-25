import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_tools_app/src/app/resources/assets.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/core/extension/build_context.dart';
import 'package:simple_tools_app/src/core/widgets/gap.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';

class ToolCardWidget extends StatelessWidget {
  const ToolCardWidget({
    required this.onTap,
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 1 / (2 * context.gridRatio) * (context.screenWidth - 60.w),
            height: 200,
            decoration: BoxDecoration(
              color: AppColor.divider,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 2 / (3 * context.gridRatio) * (context.screenWidth - 60.w),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10.w),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey.withOpacity(.15),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 15.h,
              right: 15.w,
              left: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  title,
                  color: AppColor.darkPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(height: 8),
                TextCustom(
                  description,
                  color: AppColor.secondaryText,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: AppColor.accent,
                      radius: 20.w,
                      child: SvgPicture.asset(AppSvg.arrowRight),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
