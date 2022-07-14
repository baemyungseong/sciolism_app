import 'dart:convert';

import 'package:sciolism_app/models/exam_questions.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ExamQuestionApi {
  static Future<List<ExamQuestion>> getExamQuestionsLocally(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/json/exam_questions.json");
    final List body = jsonDecode(data);

    return body.map((e) => ExamQuestion.fromJson(e)).toList();


  }
  //return body.map<ExamQuestion>(ExamQuestion.fromJson).tolist();

}
