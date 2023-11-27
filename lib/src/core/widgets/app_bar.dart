import 'package:flutter/material.dart';
import 'package:simple_tools_app/src/app/theme/app_color.dart';
import 'package:simple_tools_app/src/core/widgets/text.dart';

AppBar appBarCustom() {
  return AppBar(
    elevation: 2,
    shadowColor: AppColor.grey.withOpacity(.2),
    backgroundColor: AppColor.white,
    centerTitle: true,
    title: const TextCustom(
      'Object Detection',
      color: AppColor.darkPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
