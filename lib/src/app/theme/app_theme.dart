import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();
  static final defaultFont = GoogleFonts.roboto();
  static final ThemeData defaultAppTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
  );
}
