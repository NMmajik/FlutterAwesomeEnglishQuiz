import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/models/quiz_brain/quiz_brain_part_one.dart';
import 'package:flutter_toeic_quiz/utils/media_player.dart';
import 'package:flutter_toeic_quiz/widgets/answer_board.dart';
import 'package:flutter_toeic_quiz/widgets/answer_sheet_item.dart';
import 'package:flutter_toeic_quiz/widgets/audio_board.dart';
import 'package:flutter_toeic_quiz/widgets/bottom_controller.dart';

QuizBrainPartOne quizBrain = QuizBrainPartOne();

class PartOneScreen extends StatefulWidget {
  const PartOneScreen({Key? key}) : super(key: key);

  @override
  State<PartOneScreen> createState() => _PartOneScreenState();
}

class _PartOneScreenState extends State<PartOneScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MediaPlayer.instance.playLocal(quizBrain.getQuestionInfo().audioLocalUrl);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MediaPlayer.instance.stop();
  }

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
        title: Text(
            'Question: ${quizBrain.currentQuestionNumber}/${quizBrain.totalQuestionNumber}'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value:
                quizBrain.currentQuestionNumber / quizBrain.totalQuestionNumber,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.file(
                    File(quizBrain.getQuestionInfo().pictureLocalUrl),
                    fit: BoxFit.contain,
                  ),
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
                quizBrain.setSelectedAnswer(value);
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
            //durationTime: MediaPlayer.instance.getDurationTime(),
            changeToDurationCallBack: (timestamp) {
              MediaPlayer.instance.seekTo(seconds: timestamp.toInt());
            },
            playCallBack: () {
              MediaPlayer.instance.resume();
            },
            pauseCallBack: () {
              MediaPlayer.instance.pause();
            },
            audioPlayer: MediaPlayer.instance.audioPlayer,
          ),
          BottomController(
            prePressed: () {
              setState(() {
                if (quizBrain.preQuestion()) {
                  MediaPlayer.instance
                      .playLocal(quizBrain.getQuestionInfo().audioLocalUrl);
                }
              });
            },
            nextPressed: () {
              setState(() {
                if (quizBrain.nextQuestion()) {
                  MediaPlayer.instance
                      .playLocal(quizBrain.getQuestionInfo().audioLocalUrl);
                }
              });
            },
            checkAnsPressed: () {
              setState(() {
                quizBrain.doCheckAnswer();
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
