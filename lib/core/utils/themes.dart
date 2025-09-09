import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppThemes {
  static get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.blue,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.getTitle(color: AppColors.blue),
    ),
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      onSurface: AppColors.black,
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getBody(color: AppColors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.blue,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.getTitle(color: AppColors.blue),
    ),
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      onSurface: Colors.white,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.black,
      headerForegroundColor: AppColors.blue,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.black,
      dialBackgroundColor: AppColors.black,
      hourMinuteColor: AppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getBody(color: AppColors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
