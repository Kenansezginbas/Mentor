import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: ColorManager.yellowColor,
    ));
  }
}
