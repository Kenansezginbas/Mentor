import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';

class BlogContainer extends StatelessWidget {
  const BlogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .30,
      width: width * .90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Makale",
                  style: CustomTextStyle.titleWhiteTextStyle,
                ),
                Text(
                  "26-10-2022 21:16",
                  style: CustomTextStyle.titleWhiteTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Nasil Yazilimci Olunur ? ",
              style: CustomTextStyle.subtitleGreyTextStyle,
            ),
          ),
          Image(
            height: height * .20,
            width: width * .90,
            image: AssetImage("assets/images/mentor.png"),
            fit: BoxFit.cover,
          ),
        ],
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
}
