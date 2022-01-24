import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';

class AnswerSheetItem extends StatelessWidget {
  AnswerSheetItem(
      {Key? key,
      required this.questionNumber,
      this.selectedAns,
      this.onPressed})
      : super(key: key);

  int? selectedAns;
  int questionNumber;
  Function(int number)? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onPressed!(questionNumber);
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  '$questionNumber.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                width: 40.0,
              ),
              AnswerBox('A',
                  id: 1,
                  isChecked: selectedAns != null ? selectedAns! == 1 : false),
              AnswerBox('B',
                  id: 2,
                  isChecked: selectedAns != null ? selectedAns! == 2 : false),
              AnswerBox('C',
                  id: 3,
                  isChecked: selectedAns != null ? selectedAns! == 3 : false),
              AnswerBox('D',
                  id: 4,
                  isChecked: selectedAns != null ? selectedAns! == 4 : false),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  AnswerBox(
    this.text, {
    Key? key,
    required this.id,
    required this.isChecked,
  }) : super(key: key);

  String text;
  int id;
  bool isChecked;

  double sizeBox = 30.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeBox,
      height: sizeBox,
      decoration: BoxDecoration(
          color: isChecked ? kAnswerButtonColorSelected : Colors.white,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.all(Radius.circular(1000))),
      child: Center(child: Text(text, textAlign: TextAlign.center)),
    );
  }
}
