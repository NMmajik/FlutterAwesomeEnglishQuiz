import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/models/quiz_brain.dart';
import 'package:flutter_toeic_quiz/screens/Part5/components/answer_sheet_item.dart';
import 'package:flutter_toeic_quiz/widgets/answer_board.dart';
import 'package:flutter_toeic_quiz/widgets/audio_board.dart';
import 'package:flutter_toeic_quiz/widgets/bottom_controller.dart';

QuizBrain quizBrain = QuizBrain();

class PartFiveScreen extends StatefulWidget {
  const PartFiveScreen({Key? key}) : super(key: key);

  @override
  State<PartFiveScreen> createState() => _PartFiveScreenState();
}

class _PartFiveScreenState extends State<PartFiveScreen> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _showMyDialog();
              },
              icon: Icon(Icons.format_list_numbered_outlined))
        ],
        title: Text('Question: 1/32'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
              //value: 0.5,
              ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  //'152: \nWhy is the speaker calling?',
                  '${quizBrain.getQuestionInfo().number}.\n${quizBrain.getQuestionInfo().questionStr}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnswerBoard(
              textA: quizBrain.getQuestionInfo().ansA,
              textB: quizBrain.getQuestionInfo().ansB,
              textC: quizBrain.getQuestionInfo().ansC,
              textD: quizBrain.getQuestionInfo().ansD,
              correctAns: quizBrain.getQuestionInfo().ansChecked
                  ? quizBrain.getQuestionInfo().correctAns
                  : -1,
              selectedAns: quizBrain.getQuestionInfo().selectedAns,
              selectChanged: (value) {
                quizBrain.getQuestionInfo().selectedAns = value;
              },
            ),
            // child: AnswerBoard(
            //   textA: 'To ask how to fill out an application',
            //   textB: 'To inquire about a delivery date',
            //   textC: 'To report a problem with a product',
            //   textD: 'To revise a biling address',
            // ),
          ),
          AudioController(
            changeToDurationCallBack: (timestamp) {},
          ),
          BottomController(
            prePressed: () {
              setState(() {
                quizBrain.preQuestion();
              });
            },
            nextPressed: () {
              setState(() {
                quizBrain.nextQuestion();
              });
            },
            checkAnsPressed: () {
              setState(() {
                quizBrain.getQuestionInfo().ansChecked = true;
              });
            },
          ),
        ],
      ),
    );
  }

  void goToQuestion(int questionNum) {
    Navigator.of(context).pop();
    // setup question display here
    print('goto question: $questionNum');
  }

  Future<void> _showMyDialog() async {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? kSurfaceDarkColor : Colors.red,
          contentPadding: EdgeInsets.all(10.0),
          title: Text(
            'Answer sheet',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          content: Container(
            width: 5000.0,
            child: SingleChildScrollView(
              child: ListBody(
                children: [
                  AnswerSheetItem(
                    questionNumber: 101,
                    selectedAns: 1,
                    onPressed: goToQuestion,
                  ),
                  AnswerSheetItem(questionNumber: 102, onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 103, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 101,
                      selectedAns: 1,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 102, onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 103, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                  AnswerSheetItem(
                      questionNumber: 104,
                      selectedAns: 3,
                      onPressed: goToQuestion),
                  AnswerSheetItem(questionNumber: 105, onPressed: goToQuestion),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
