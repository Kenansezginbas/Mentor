import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/widgets/avatars/custom_circle_avatar.dart';

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
        CustomCircleAvatar(),
        Text(
          "TOR",
          style: CustomTextStyle.logoTextStyle,
        )
      ],
    );
  }
}
