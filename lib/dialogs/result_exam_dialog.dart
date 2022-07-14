


import 'package:flutter/material.dart';

class ResultExamDialog extends StatelessWidget {
  const ResultExamDialog({ required this.mark,
    required this.trueAnswer, required this.wrongAnswer,
    Key? key,
  }) : super(key: key);

  final double mark;
  final int trueAnswer;
  final int wrongAnswer;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Result'),
      content: Text('Số điểm của bài thi là: $mark\nSố câu đúng: $trueAnswer\nSố câu sai: $wrongAnswer'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'))
      ],
    );
  }
}