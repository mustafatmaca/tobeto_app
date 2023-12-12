import 'package:flutter/material.dart';
import 'app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.colorScheme.primary,
      scaffoldBackgroundColor: AppColor.colorScheme.background,
      textTheme: GoogleFonts.ralewayTextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.colorScheme.primary,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      textTheme: GoogleFonts.ralewayTextTheme(),
    );
  }
}
