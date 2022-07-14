import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sciolism_app/dialogs/change_question_dialog.dart';
import 'package:sciolism_app/dialogs/result_exam_dialog.dart';
import 'package:sciolism_app/dialogs/submit_exam_dialog.dart';
import 'package:sciolism_app/models/exam_questions.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../dialogs/stop_exam_dialog.dart';
import '../../dialogs/submit_exam_timeout_dialog.dart';
import '../../models/question.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({required this.examQuestion, required this.uid, Key? key})
      : super(key: key);
  final ExamQuestion examQuestion;
  final String uid;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final PageController controller = PageController();
  Duration duration = Duration(minutes: 45);
  Timer? timer;
  bool built = false;
  bool timeout = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Widget w = WillPopScope(
      onWillPop: () => buildStopExamDialog(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.examQuestion.id),
            actions: [
              IconButton(
                  onPressed: () =>
                      _buildChangeQuestionDialog(widget.examQuestion.questions),
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.apps_outlined,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () => controller.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut),
                  icon: Icon(Icons.keyboard_arrow_left)),
              IconButton(
                  onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutQuart),
                  icon: Icon(Icons.keyboard_arrow_right))
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(children: [
              buildStateExamPage(),
              Expanded(
                child: PageView(
                    controller: controller,
                    children: widget.examQuestion.questions
                        .map(
                          (e) => SingleChildScrollView(
                            child: Column(children: buildColumn(e)),
                          ),
                        )
                        .toList()),
              ),
            ]),
          )),
    );

    built = true;
    return w;
  }

  Stack buildStateExamPage() {
    if (widget.examQuestion.submited) {
      return Stack(children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text('Điểm: ${widget.examQuestion.mark.toString()}',
                    style: TextStyle(fontSize: 30)))),
        //Align(alignment: Alignment.center, child: buildTime()),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => {},
              child: Text('đã nộp'),
            ))
      ]);
    } else {
      return Stack(children: [
        Align(alignment: Alignment.center, child: buildTime()),
        Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () => handleSubmittingExam(),
                child: const FittedBox(child: Text('Nộp bài')),
              ),
            ))
      ]);
    }
  }

  Future<bool> buildStopExamDialog() async {
    if (widget.examQuestion.submited) return Future.value(true);
    final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const AlertStopExamDialog();
        });
    if (value != null)
      return Future.value(value);
    else
      return Future.value(false);
  }

  Future _buildChangeQuestionDialog(List<Question> questions) async {
    int? x;
    await showDialog<int>(
            context: context,
            builder: (context) {
              return ChangeQuestionDialog(
                  questions: questions, submited: widget.examQuestion.submited);
            })
        .then((value) => {
              x = value ?? controller.page?.toInt(),
              controller.jumpToPage(x ?? 0)
            });
  }

  DateTime selectDate = DateTime.now();
  handleSubmittingExam() async {
    await showDialog<bool>(
        context: context,
        builder: (context) {
          return const SubmitExamDialog();
        }).then((value) => {
          if (value != null)
            {
              if (value)
                {
                  setState(() {
                    widget.examQuestion.makeMark();
                    FirebaseFirestore.instance.collection("marks").add({
                      'id': '',
                      'uid': widget.uid,
                      'examName': '1',
                      'timeSubmit': selectDate,
                      'mark': widget.examQuestion.makeMark(),
                    }).then((value) => FirebaseFirestore.instance
                        .collection("marks")
                        .doc(value.id)
                        .update({'id': value.id}));
                  })
                }
            }
        });
  }

  handleSubmittingExamTimeout() async {
    timeout = true;
    await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const SubmitExamTimeoutDialog();
        }).then((value) => {
          if (value != null)
            {
              if (value)
                {
                  setState(() {
                    widget.examQuestion.makeMark();
                  })
                }
            }
        });
  }

  Widget buildTime() {
    //if(widget.examQuestion.submited) return Text('');
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        FittedBox(
          child: Text(
            '$minutes:$seconds',
            style: TextStyle(fontSize: 15),
          ),
        ),
        CircularStepProgressIndicator(
          circularDirection: CircularDirection.counterclockwise,
          totalSteps: 6,
          currentStep: duration.inSeconds + duration.inMinutes * 60,
          selectedColor: Colors.greenAccent,
          unselectedColor: Colors.grey[200],
          padding: 0,
          selectedStepSize: 9.0,
          roundedCap: (_, __) => true,
        ),
      ]),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => subtractTime());
  }

  subtractTime() {
    int time = duration.inMinutes + duration.inSeconds;
    if (!timeout && time == 0 && !widget.examQuestion.submited)
      handleSubmittingExamTimeout();
    final subtractSeconds = -1;
    if (!mounted) return;
    if (time == 0) return;
    setState(() {
      final seconds = duration.inSeconds + subtractSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  buildColumn(Question question) {
    List<Widget> list = <Widget>[];
    list.add(
      Card(
          elevation: 0.0,
          color: Colors.white,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(7.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(1, 3))
                ] // Make rounded corner of border
                ),
            child: Column(children: [
              Text(
                question.question,
                style: TextStyle(fontSize: 15),
              ),
              if (question.image != null) ...[
                Image.network(question.image ?? '')
              ],
            ]),
          )),
    );

    list.add(SizedBox(
      height: 20,
    ));

    list.addAll((question.answers.map(
      (e) => Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: getColor(question, e.identifier, round: true), width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: getColor(question, e.identifier),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(4.0),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    // width: 3.0,
                    color: Colors.greenAccent,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: Text(
                e.identifier.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(e.answer),
            trailing: ShowAnswer(question, e.identifier),
            onTap: () {
              if (!widget.examQuestion.submited) {
                setState(() {
                  question.selectedAnswer = e.identifier;
                });
              }
            },
          )),
    )));

    if (widget.examQuestion.submited) {
      if (built) {
        if (controller.page != null) {
          list.add(ShowSolutionQuestion(controller.page?.toInt()));
        }
      }
    }

    return list;
  }

  getColor(Question question, identifier, {bool round = false}) {
    if (question.selectedAnswer == null) {
      if (round) return Colors.black26;
      return Colors.white;
    } else if (question.selectedAnswer == identifier) {
      if (round) return Colors.greenAccent;
      return Theme.of(context).secondaryHeaderColor;
    } else {
      if (round) return Colors.black26;
      return Colors.white;
    }
  }

  ShowAnswer(Question question, String identifier) {
    if (widget.examQuestion.submited) {
      if (question.correctAnswer == identifier)
        return Icon(Icons.check_circle, color: Colors.green);
      else
        return Icon(Icons.dangerous, color: Colors.red);
    }
  }

  Widget ShowSolutionQuestion(int? index) {
    if (index != null) {
      if (widget.examQuestion.questions[index].solution != null) {
        Widget widg = Text('');
        if (widget.examQuestion.questions[index].solutionImage != null)
          widg = Image.network(
              widget.examQuestion.questions[index].solutionImage ?? '');
        return Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            children: [
              const Text(
                "Lời Giải: ",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              widg,
              Stack(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        widget.examQuestion.questions[index].solution ?? ''))
              ]),
            ],
          ),
        );
      } else
        return Text('');
    } else
      return Text('');
  }
}
