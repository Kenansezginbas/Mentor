import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_text_style.dart';

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
          style: CustomTextStyle.subtitleGreyTextStyle,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            buttonText,
            style: CustomTextStyle.titleWhiteTextStyle,
          ),
        ),
      ],
    );
  }
}
