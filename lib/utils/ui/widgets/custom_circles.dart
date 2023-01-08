import 'package:flutter/material.dart';

import '../../../config/themes/color_manager.dart';

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
