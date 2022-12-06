import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_text_style.dart';

class QuestionAnswerCard extends StatelessWidget {
  final String question, answer, type;
  final bool answered;
  const QuestionAnswerCard(
      {super.key,
      required this.question,
      required this.answer,
      required this.type,
      required this.answered});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListTile(
      title: Text(
        question,
        style: CustomTextStyle.titleWhiteTextStyle,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          answered == true ? "Cevaplandı" : "Cevaplanmadı",
          style: CustomTextStyle.subtitleGreyTextStyle,
        ),
      ),
    );
  }
}
