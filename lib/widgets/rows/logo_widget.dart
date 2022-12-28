import 'package:flutter/material.dart';
import 'package:mentor/widgets/avatars/custom_circle_avatar.dart';

import '../../themes/style_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "MEN",
          style: StyleManager.logoTextStyle,
        ),
        const CustomCircleAvatar(),
        Text(
          "TOR",
          style: StyleManager.logoTextStyle,
        )
      ],
    );
  }
}
