import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor/widgets/custom_circles.dart';
import 'package:mentor/widgets/cards/question_answer_card.dart';

class QuestionAnswerView extends StatefulWidget {
  const QuestionAnswerView({super.key});

  @override
  State<QuestionAnswerView> createState() => _QuestionAnswerViewState();
}

class _QuestionAnswerViewState extends State<QuestionAnswerView> {
  final firebaseFirestore = FirebaseFirestore.instance.collection("Questions");

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const CustomCircle();
          }
          final data = snapshot.requireData.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return QuestionAnswerCard(
                question: data[index]["Question"],
                answer: data[index]["Answer"],
                type: data[index]["Type"],
                answered: data[index]["Answered"],
              );
            },
          );
        },
      ),
    );
  }
}
