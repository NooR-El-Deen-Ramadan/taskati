// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatelessWidget {
  MainTextFormField({
    super.key,
    required this.controller,
    required this.textFormFieldText,
    this.maxTextLines = 1,
      this.validator,
  });
  String? Function(String?)? validator;
  int maxTextLines;
  final String textFormFieldText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      maxLines: maxTextLines,
      decoration: InputDecoration(
          hint: Text(
          textFormFieldText,
          style: AppFontStyles.getRegular(fontColor: AppColors.greyColor),
        ),
      ),
    );
  }
}
