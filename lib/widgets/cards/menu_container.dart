import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/color_manager.dart';
import '../../themes/style_manager.dart';

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
        decoration: BoxDecoration(
          color: ColorManager.darkColor2,
          border: Border(
            bottom: BorderSide(
              color: ColorManager.yellowColor,
              width: 3,
            ),
          ),
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: StyleManager.titleWhiteTextStyle,
          ),
          trailing: Icon(
            CupertinoIcons.right_chevron,
            color: ColorManager.whiteColor,
          ),
        ),
      );
}
