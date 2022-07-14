


import 'package:flutter/material.dart';

class SubmitExamDialog extends StatelessWidget {
  const SubmitExamDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('bạn có chắc muốn nộp bài thi?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Không')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Có'))
      ],
    );
  }
}