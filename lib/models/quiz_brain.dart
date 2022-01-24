import 'package:flutter_toeic_quiz/models/question_part_five.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<QuestionPartFive> _questionPartFiveBank = [
    QuestionPartFive(
      number: 1,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartFive(
      number: 2,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer A',
      ansC: 'answer A',
      ansD: 'answer A',
      correctAns: 1,
    ),
    QuestionPartFive(
      number: 3,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer A',
      ansC: 'answer A',
      ansD: 'answer A',
      correctAns: 1,
    ),
    QuestionPartFive(
      number: 4,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer A',
      ansC: 'answer A',
      ansD: 'answer A',
      correctAns: 1,
    ),
    QuestionPartFive(
      number: 5,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer A',
      ansC: 'answer A',
      ansD: 'answer A',
      correctAns: 1,
    ),
    QuestionPartFive(
      number: 6,
      questionStr: 'this is demo question',
      ansA: 'answer A',
      ansB: 'answer A',
      ansC: 'answer A',
      ansD: 'answer A',
      correctAns: 1,
    ),
  ];

  void getQuestionText() {}

  void nextQuestion() {
    if (_questionNumber < _questionPartFiveBank.length - 1) {
      _questionNumber++;
    }
  }

  void preQuestion() {
    if (_questionNumber > 0) {
      _questionNumber--;
    }
  }

  QuestionPartFive getQuestionInfo() {
    return _questionPartFiveBank[_questionNumber];
  }
}
