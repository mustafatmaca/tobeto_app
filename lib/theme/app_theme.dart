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
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.colorScheme.background,
        foregroundColor: AppColor.textColor,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColor.colorScheme.background,
      ),
      iconTheme: IconThemeData(
        color: AppColor.textColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColor.textColor,
        suffixIconColor: AppColor.textColor,
        labelStyle: TextStyle(
          color: AppColor.textColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.colorScheme.primary,
            foregroundColor: AppColor.colorScheme.background),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.colorScheme.primary,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      textTheme: GoogleFonts.ralewayTextTheme().apply(
        bodyColor: AppColor.textColorDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundDark,
        foregroundColor: AppColor.textColorDark,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColor.backgroundDark,
      ),
      iconTheme: IconThemeData(
        color: AppColor.textColorDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColor.textColorDark,
        suffixIconColor: AppColor.textColorDark,
        labelStyle: TextStyle(
          color: AppColor.textColorDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.colorScheme.primary,
            foregroundColor: AppColor.colorScheme.background),
      ),
    );
  }
}
