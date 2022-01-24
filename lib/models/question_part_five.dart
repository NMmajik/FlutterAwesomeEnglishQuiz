class QuestionPartFive {
  int number;
  int correctAns;
  bool ansChecked = false;
  int selectedAns = -1;
  String questionStr;
  String ansA;
  String ansB;
  String ansC;
  String ansD;
  QuestionPartFive({
    required this.number,
    required this.correctAns,
    required this.questionStr,
    required this.ansA,
    required this.ansB,
    required this.ansC,
    required this.ansD,
  });
}
