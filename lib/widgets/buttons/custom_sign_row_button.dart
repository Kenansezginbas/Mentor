import 'package:flutter/material.dart';

import '../../themes/custom_text_style.dart';

class CustomSignRowButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final text, buttonText;
  const CustomSignRowButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: StyleManager.subtitleGreyTextStyle,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: StyleManager.titleWhiteTextStyle,
          ),
        ),
      ],
    );
  }
}
