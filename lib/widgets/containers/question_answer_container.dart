import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';

class QuestionAnswerContainer extends StatelessWidget {
  const QuestionAnswerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .10,
      width: width * .90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Flutter icin turkce kaynak tavsiye edebilecek var mi ?",
              style: CustomTextStyle.titleWhiteTextStyle,
            ),
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
