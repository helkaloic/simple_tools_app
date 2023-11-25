import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_tools_app/src/app/resources/assets.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                'Pick',
                color: AppColor.darkPrimary,
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
              TextCustom(
                'your tools',
                fontSize: 38,
                color: AppColor.darkPrimary,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
                left: 10.w,
              ),
              color: Colors.transparent,
              child: SvgPicture.asset(AppSvg.menu),
            ),
          ),
        ],
      ),
    );
  }
}
