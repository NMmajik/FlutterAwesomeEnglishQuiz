class QuizBrainPartOne {
  QuizBrainPartOne() {}
  int _questionNumber = 0;
  final QuestionPartOne invisiableQuestion = QuestionPartOne(
    number: 0,
    pictureLocalUrl: '',
    audioLocalUrl: '',
    ansA: '',
    ansB: '',
    ansC: '',
    ansD: '',
    correctAns: -1,
  );
  final List<QuestionPartOne> _questionPartOneBank = [
    QuestionPartOne(
      number: 1,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/001.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/001.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartOne(
      number: 2,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/002.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/002.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartOne(
      number: 3,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/003.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/003.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartOne(
      number: 4,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/004.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/004.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartOne(
      number: 5,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/005.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/005.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
    QuestionPartOne(
      number: 6,
      pictureLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/pictures/006.PNG',
      audioLocalUrl:
          '/data/user/0/com.littlepea.flutter_awesome_english/app_flutter/resource_files/toeic_book/ETS_2021_SUMMER/TEST_1/audios/006.mp3',
      ansA: 'answer A',
      ansB: 'answer B',
      ansC: 'answer C',
      ansD: 'answer D',
      correctAns: 1,
    ),
  ];

  int get currentQuestionNumber => (_questionNumber + 1);

  get totalQuestionNumber => (_questionPartOneBank.length);

  void getQuestionText() {}

  bool nextQuestion() {
    if (_questionNumber < _questionPartOneBank.length - 1) {
      _questionNumber++;
      return true;
    }
    return false;
  }

  bool preQuestion() {
    if (_questionNumber > 0) {
      _questionNumber--;
      return true;
    }
    return false;
  }

  void doCheckAnswer() {
    _questionPartOneBank[_questionNumber].ansChecked = true;
  }

  void setSelectedAnswer(int selectedAns) {
    _questionPartOneBank[_questionNumber].selectedAns = selectedAns;
  }

  QuestionPartOne getQuestionInfo() {
    if (_questionPartOneBank[_questionNumber].ansChecked)
      return _questionPartOneBank[_questionNumber];
    else {
      // coppy visiable feild
      invisiableQuestion.number = _questionPartOneBank[_questionNumber].number;
      invisiableQuestion.pictureLocalUrl =
          _questionPartOneBank[_questionNumber].pictureLocalUrl;
      invisiableQuestion.audioLocalUrl =
          _questionPartOneBank[_questionNumber].audioLocalUrl;
      invisiableQuestion.selectedAns =
          _questionPartOneBank[_questionNumber].selectedAns;
      return invisiableQuestion;
    }
  }
}

class QuestionPartOne {
  int number;
  int correctAns;
  bool ansChecked = false;
  int selectedAns = -1;
  String pictureLocalUrl;
  String audioLocalUrl;
  String ansA;
  String ansB;
  String ansC;
  String ansD;
  QuestionPartOne({
    required this.number,
    required this.correctAns,
    required this.pictureLocalUrl,
    required this.audioLocalUrl,
    required this.ansA,
    required this.ansB,
    required this.ansC,
    required this.ansD,
  });
}
