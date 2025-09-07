import 'package:flutter/material.dart';
import 'package:taskati/core/constants/fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    //scaffold theme
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontStyles.getSemiBold(
        fontColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
    ),

    //snackbar theme
    snackBarTheme: SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryColor,
    ),

    //font theme
    fontFamily: Fonts.poppins,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.darkColor,
    ),

    //datepicker theme
    datePickerTheme: DatePickerThemeData(
      headerForegroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      subHeaderForegroundColor: AppColors.blackColor,
    ),

    //timepicker theme
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: AppColors.greyColor,
      dayPeriodTextColor: AppColors.primaryColor,
      hourMinuteTextColor: AppColors.whiteColor,
      hourMinuteColor: AppColors.darkColor,
      dialBackgroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
    ),

    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
  );

  //                \\
  // dark theme \\
  //                 \\
  static ThemeData darkTheme = ThemeData(
    fontFamily: Fonts.poppins,

    //scaffold theme
    scaffoldBackgroundColor: AppColors.darkColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontStyles.getSemiBold(
        fontColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.darkColor,
      foregroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
    ),

    //snackbar theme
    snackBarTheme: SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryColor,
    ),

    //font theme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.whiteColor,
    ),

    //timepicker theme
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: AppColors.whiteColor,
      hourMinuteColor: AppColors.primaryColor,
      dialBackgroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.darkColor,
    ),

    //datepickertheme
    datePickerTheme: DatePickerThemeData(
      headerForegroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.darkColor,
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppFontStyles.getMedium(fontColor: AppColors.greyColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
  );
}
