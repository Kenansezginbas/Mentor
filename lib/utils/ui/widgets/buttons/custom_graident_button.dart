import 'package:flutter/material.dart';
import 'package:mentor/config/themes/color_manager.dart';

import '../../../../config/themes/style_manager.dart';

class CustomGraidentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomGraidentButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: RadialGradient(
            radius: 2,
            colors: [ColorManager.darkColor, ColorManager.darkColor2],
          ),
        ),
        child: Center(
          child: Text(buttonText, style: StyleManager.titleWhiteTextStyle),
        ),
      ),
    );
  }
}
