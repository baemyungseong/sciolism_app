import 'package:sciolism_app/models/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_questions.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamQuestion {
  String id;
  String description;
  List<Question> questions;

  @JsonKey(defaultValue: 0)
  double mark;

  @JsonKey(defaultValue: false)
  bool submited;

  ExamQuestion(
      this.id, this.description, this.questions, this.submited, this.mark);

  factory ExamQuestion.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$ExamQuestionToJson(this);

  double makeMark() {
    int correctAnswer = 0;
    questions.forEach((element) {
      if (element.selectedAnswer != null) {
        if (element.selectedAnswer == element.correctAnswer) correctAnswer++;
      }
    });
    mark = 10 * correctAnswer / questions.length;
    submited = true;

    return mark;
  }
}
