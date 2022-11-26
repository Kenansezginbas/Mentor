import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "MEN",
          style: CustomTextStyle.logoTextStyle,
        ),
        CircleAvatar(
          backgroundColor: CustomColors.orangeColor,
        ),
        Text(
          "TOR",
          style: CustomTextStyle.logoTextStyle,
        )
      ],
    );
  }
}
