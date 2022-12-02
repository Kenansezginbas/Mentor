import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_text_style.dart';

class CustomPostText extends StatelessWidget {
  final String text;
  const CustomPostText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyle.titleWhiteTextStyle,
    );
  }
}
