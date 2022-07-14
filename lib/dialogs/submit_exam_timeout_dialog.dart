


import 'package:flutter/material.dart';

class SubmitExamTimeoutDialog extends StatelessWidget {
  const SubmitExamTimeoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: const Text('Hết giờ rồi, nộp bài nhaa'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const FittedBox(child: Text('Dạ 😆', style: TextStyle(fontSize: 20),)))
      ],
    );
  }
}