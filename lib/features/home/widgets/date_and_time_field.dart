import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';

class DateAndTimeField extends StatelessWidget {
  const DateAndTimeField({
    super.key,
    required this.onTap,
    required this.icon,
    required this.controller,
  });
final Function() onTap;
  final TextEditingController controller;
final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppFontStyles.getRegular(fontColor: AppColors.darkColor),
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        suffixIconColor: AppColors.primaryColor,
        suffixIcon: icon
      ),
      onTap:onTap
        
      
    );
  }
}
