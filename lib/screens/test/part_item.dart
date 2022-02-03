import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/screens/part_screens/part_one/part_one_screen.dart';
import 'package:flutter_toeic_quiz/widgets/rounded_botton.dart';
import 'package:percent_indicator/percent_indicator.dart';

List<String> testDescription = [
  'Photographs',
  'Question-Response',
  'Coversations',
  'Short Talks',
  'Incomplete Sentences',
  'Text Completion',
  'Reading Comprehension',
];
List<int> numberQuestionDefault = [
  6,
  25,
  39,
  30,
  30,
  16,
  54,
];

List<IconData> testIconData = [
  Icons.image_search,
  Icons.sms_outlined,
  Icons.question_answer_outlined,
  Icons.campaign_outlined,
  Icons.short_text_outlined,
  Icons.segment_outlined,
  Icons.format_indent_increase_outlined,
];

class PartItem extends StatelessWidget {
  PartItem({
    Key? key,
    required this.partNumber,
    this.correctAns = 5,
    this.totalQuestions,
  }) : super(key: key);

  int partNumber;
  int? totalQuestions;
  int correctAns;

  @override
  Widget build(BuildContext context) {
    totalQuestions ??= numberQuestionDefault[partNumber - 1];
    double correctPercent =
        (correctAns * 100 / totalQuestions!).toDouble() / 100;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => PartOneScreen(),
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardRadiusDefault),
        ),
        elevation: kCardElevationDefaut,
        child: Padding(
          padding: const EdgeInsets.all(kPaddingDefault),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(testIconData[partNumber - 1],
                            size: 30.0, color: kIconColor),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Part $partNumber',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                      totalQuestions! < 10
                                          ? '0$totalQuestions'
                                          : '$totalQuestions',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: kHighlightColor,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    ' question',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(
                                      correctAns < 10
                                          ? '0$correctAns'
                                          : '$correctAns',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: kHighlightColor,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    ' Correct',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    testDescription[partNumber - 1],
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 50.0,
                      percent: correctPercent,
                      center: Text('${(correctPercent * 100).toInt()}%'),
                      progressColor: kCircularProgressColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
