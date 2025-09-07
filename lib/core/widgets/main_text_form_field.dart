// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:taskati/core/utils/fonts.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatelessWidget {
  MainTextFormField({
    super.key,
     this.controller,
     this.textFormFieldText,
    this.maxTextLines = 1,
      this.validator,
  });
  String? Function(String?)? validator;
  int maxTextLines;
  String ?textFormFieldText;
 TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      maxLines: maxTextLines,
      style: AppFontStyles.getRegular(),
      decoration: InputDecoration(
          hint: Text(
          textFormFieldText??"",
          style: AppFontStyles.getRegular(),
        ),
      ),
    );
  }
}
