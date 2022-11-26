import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';

class CustomDecoration {
  textFieldDecoration(String hintText) => InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyle.subtitleGreyTextStyle,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: CustomColors.yellowColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: CustomColors.whiteColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: CustomColors.whiteColor,
          ),
        ),
      );
}
