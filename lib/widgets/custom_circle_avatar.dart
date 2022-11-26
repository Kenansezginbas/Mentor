import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomColors.orangeColor,
    );
  }
}
