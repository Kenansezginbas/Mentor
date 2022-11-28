import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        customContainer(
          height: height,
          width: width,
          title: "Hakkımızda",
          onTap: () {},
        ),
        customContainer(
          height: height,
          width: width,
          title: "Çıkış",
          onTap: () {},
        ),
      ],
    );
  }

  Widget customContainer(
          {required double height,
          required double width,
          required String title,
          required GestureTapCallback onTap}) =>
      Container(
        height: height * .06,
        width: width,
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: CustomTextStyle.titleWhiteTextStyle,
          ),
          trailing: Icon(
            CupertinoIcons.right_chevron,
            color: CustomColors.whiteColor,
          ),
        ),
        decoration: BoxDecoration(
          color: CustomColors.darkColor2,
          border: Border(
            bottom: BorderSide(
              color: CustomColors.yellowColor,
              width: 3,
            ),
          ),
        ),
      );
}
