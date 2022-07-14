import 'package:sciolism_app/api/exam_questions_api.dart';
import 'package:sciolism_app/models/exam_questions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'exam_page.dart';

class ExamQuestionsPage extends StatelessWidget {
  const ExamQuestionsPage({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ExamQuestion>>(
        future: ExamQuestionApi.getExamQuestionsLocally(context),
        builder: (context, snapshot) {
          final List<ExamQuestion>? examQuestions = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Center(child: Text(snapshot.error.toString()));
              else if (examQuestions != null)
                return buildExamQuestions(examQuestions);
              else
                return Text("null");
          }
        },
      ),
    );
  }

  Widget buildExamQuestions(List<ExamQuestion> examQuestions) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: examQuestions.length,
      itemBuilder: (context, index) {
        final examquestion = examQuestions[index];

        return ListTile(
          leading: Icon(Icons.book_online_outlined),
          title: Text('Đề thi số ${index + 1}'),
          subtitle: Text(examquestion.description),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ExamPage(examQuestion: examquestion, uid: uid)));
          },
        );
      },
    );
  }
}

// reference
// https://www.youtube.com/watch?v=Rlf5q2EGHzc&ab_channel=JohannesMilke