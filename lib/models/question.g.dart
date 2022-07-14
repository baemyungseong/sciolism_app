// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['question'] as String,
      (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['correctAnswer'] as String,
      json['image'] as String?,
      json['solution'] as String?,
      json['solutionImage'] as String?,
    )..selectedAnswer = json['selectedAnswer'] as String?;

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'correctAnswer': instance.correctAnswer,
      'selectedAnswer': instance.selectedAnswer,
      'image': instance.image,
      'solution': instance.solution,
      'solutionImage': instance.solutionImage,
    };
