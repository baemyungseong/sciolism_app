

import 'package:sciolism_app/models/answer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question{
  String question;
  List<Answer> answers;
  String correctAnswer;

  @JsonKey(defaultValue: null)
  String? selectedAnswer;

  @JsonKey(defaultValue: null)
  String? image;

  @JsonKey(defaultValue: null)
  String? solution;

  @JsonKey(defaultValue: null)
  String? solutionImage;

  Question(this.question, this.answers, this.correctAnswer, this.image,
      this.solution, this.solutionImage);

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

}