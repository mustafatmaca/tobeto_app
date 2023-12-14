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
      textTheme: GoogleFonts.ralewayTextTheme().apply(
        bodyColor: AppColor.textColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: true,
        colorScheme: AppColor.colorScheme,
        primaryColor: AppColor.colorScheme.primary,
        scaffoldBackgroundColor: AppColor.backgroundDark,
        textTheme: GoogleFonts.ralewayTextTheme()
            .apply(bodyColor: AppColor.textColorDark),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColor.backgroundDark,
            foregroundColor: AppColor.textColorDark),
        drawerTheme: DrawerThemeData(backgroundColor: AppColor.backgroundDark),
        iconButtonTheme: const IconButtonThemeData(),
        iconTheme: IconThemeData(color: AppColor.textColorDark)
        );
  }
}
