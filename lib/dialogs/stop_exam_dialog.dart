


import 'package:flutter/material.dart';

class AlertStopExamDialog extends StatelessWidget {
  const AlertStopExamDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('bạn có muốn dừng làm bài thi?'),
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