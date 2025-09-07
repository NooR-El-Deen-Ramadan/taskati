import 'package:flutter/material.dart';
import 'package:taskati/core/constants/fonts.dart';

class AppFontStyles {
  static TextStyle getRegular({
    double fontSize = 16,
    Color? fontColor ,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(
    fontFamily: Fonts.poppins,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );

  static TextStyle getMedium({
    double fontSize = 18,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w500,
  }) => TextStyle(
    fontFamily: Fonts.poppins,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );

  static TextStyle getSemiBold({
    double fontSize = 20,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    fontFamily: Fonts.poppins,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: fontColor,
  );

  static TextStyle getBold({
    double fontSize = 24,
    Color? fontColor ,
    FontWeight fontWeight = FontWeight.w700,
  }) => TextStyle(
    fontFamily: Fonts.poppins,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: fontColor,
  );
}
