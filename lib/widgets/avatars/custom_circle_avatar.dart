import 'package:flutter/material.dart';

import '../../themes/custom_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.orangeColor,
    );
  }
}
