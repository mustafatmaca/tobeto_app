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
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          displayColor: AppColor.textColor,
          bodyColor: AppColor.textColor,
        ),
        cardColor: AppColor.cardColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.colorScheme.background,
          foregroundColor: AppColor.textColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.colorScheme.background,
          unselectedItemColor: AppColor.textColor,
          selectedItemColor: AppColor.colorScheme.primary,
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
        cardTheme: CardTheme(color: AppColor.colorScheme.background));
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.colorScheme.primary,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      textTheme: GoogleFonts.ralewayTextTheme().apply(
        displayColor: AppColor.textColorDark,
        bodyColor: AppColor.textColorDark,
      ),
      cardColor: AppColor.cardColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundDark,
        foregroundColor: AppColor.textColorDark,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.backgroundDark,
        unselectedItemColor: AppColor.textColorDark,
        selectedItemColor: AppColor.colorScheme.primary,
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
      cardTheme: CardTheme(color: AppColor.containerdarkbackground),
    );
  }
}
