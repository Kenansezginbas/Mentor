import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../themes/color_manager.dart';

class CustomFabButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  const CustomFabButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorManager.orangeColor,
      child: Icon(
        CupertinoIcons.add_circled,
        size: 30,
        color: ColorManager.darkColor,
      ),
    );
  }
}
