import 'package:flutter/material.dart';

import '../../themes/style_manager.dart';

class CustomPostText extends StatelessWidget {
  final String text;
  const CustomPostText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleManager.titleWhiteTextStyle,
    );
  }
}
