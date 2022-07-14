// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamQuestion _$ExamQuestionFromJson(Map<String, dynamic> json) => ExamQuestion(
      json['id'] as String,
      json['description'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['submited'] as bool? ?? false,
      (json['mark'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ExamQuestionToJson(ExamQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'mark': instance.mark,
      'submited': instance.submited,
    };
