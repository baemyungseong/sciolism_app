import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class markModel {
  final String id;
  final String uid;
  final String mark;
  final String examName;

  markModel({
    required this.id,
    required this.uid,
    required this.mark,
    required this.examName,
  });

  factory markModel.fromDocument(Map<String, dynamic> doc) {
    return markModel(
      id: doc['id'],
      uid: doc['uid'],
      mark: doc['mark'],
      examName: doc['examName'],
    );
  }
}
