import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';

class CustomFabButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  const CustomFabButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        CupertinoIcons.add_circled,
        size: 30,
        color: CustomColors.darkColor,
      ),
      backgroundColor: CustomColors.orangeColor,
    );
  }
}
