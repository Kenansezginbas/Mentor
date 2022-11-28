import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

class CustomDialog {
  showCustomDialog(BuildContext context, String title, String content) {
    final platform = Theme.of(context).platform;
    showDialog(
      context: context,
      builder: (context) {
        if (platform == TargetPlatform.iOS) {
          return Theme(
            data: ThemeData.dark(),
            child: CupertinoAlertDialog(
              title: customText(title),
              content: customText(content),
              actions: [
                customTextButton(context),
              ],
            ),
          );
        } else if (platform == TargetPlatform.android) {
          return AlertDialog(
            backgroundColor: CustomColors.darkColor,
            title: customText(title),
            content: customText(content),
            actions: [
              customTextButton(context),
            ],
          );
        } else {
          return AlertDialog();
        }
      },
    );
  }

  Text customText(String title) {
    return Text(
      title,
      style: CustomTextStyle.titleWhiteTextStyle,
    );
  }

  showCustomCupertinoDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: customText(title),
            content: customText(content),
            actions: [
              customTextButton(context),
            ],
          ),
        );
      },
    );
  }

  TextButton customTextButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        "Geri Dön",
        style: CustomTextStyle.titleWhiteTextStyle,
      ),
    );
  }

  showCustomProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: CustomColors.orangeColor,
          ),
        );
      },
    );
  }
}