import 'package:flutter/material.dart';
import 'package:taskati/core/constants/fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';

class AppTheme{
static ThemeData lightTheme=ThemeData(
        fontFamily: Fonts.poppins,
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: AppFontStyles.getSemiBold(fontColor: AppColors.primaryColor),
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.primaryColor,
          surfaceTintColor: Colors.transparent,
        ),
        snackBarTheme: SnackBarThemeData(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.primaryColor,
        ),

        //input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          
           enabledBorder: OutlineInputBorder(
            
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor,width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red,width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red,width: 2),
        ),
      
    
        ),
);

}