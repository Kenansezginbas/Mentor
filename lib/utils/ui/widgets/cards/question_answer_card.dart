import 'package:flutter/material.dart';

import '../../../../config/themes/style_manager.dart';

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
    return ListTile(
      title: Text(
        question,
        style: StyleManager.titleWhiteTextStyle,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          answered == true ? "Cevaplandı" : "Cevaplanmadı",
          style: StyleManager.subtitleGreyTextStyle,
        ),
      ),
    );
  }
}
