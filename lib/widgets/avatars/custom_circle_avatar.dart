import 'package:flutter/material.dart';

import '../../themes/color_manager.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorManager.orangeColor,
    );
  }
}
