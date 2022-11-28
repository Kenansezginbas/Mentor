import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/widgets/containers/blog_container.dart';
import 'package:mentor/widgets/rows/logo_widget.dart';
import 'package:mentor/widgets/containers/question_answer_container.dart';

class QuestionAnswerView extends StatefulWidget {
  const QuestionAnswerView({super.key});

  @override
  State<QuestionAnswerView> createState() => _QuestionAnswerViewState();
}

class _QuestionAnswerViewState extends State<QuestionAnswerView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return QuestionAnswerContainer();
        },
      ),
    );
  }
}
