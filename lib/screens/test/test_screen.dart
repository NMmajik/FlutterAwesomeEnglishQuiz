import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/local/test_hive_api.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_test.dart';
import 'package:flutter_toeic_quiz/screens/test/part_item.dart';
import 'package:flutter_toeic_quiz/widgets/rounded_botton.dart';

class TestScreen extends StatelessWidget {
  TestScreen({
    Key? key,
    required this.testBoxId,
  }) : super(key: key);

  String testBoxId;
  @override
  Widget build(BuildContext context) {
    ToeicTest toeicTest = TestHiveApi.instance.getByID(testBoxId);
    final List<PartItem> partItems = [
      PartItem(partNumber: 1, totalQuestions: toeicTest.partOne.length),
      PartItem(partNumber: 2, totalQuestions: toeicTest.partTwo.length),
      PartItem(partNumber: 3, totalQuestions: toeicTest.partThree.length),
      PartItem(partNumber: 4, totalQuestions: toeicTest.partFour.length),
      PartItem(partNumber: 5),
      PartItem(partNumber: 6),
      PartItem(partNumber: 7),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('START FULL TEST'),
        icon: Icon(Icons.play_arrow_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          'Test 1',
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: 4.0, right: 4.0, top: index == 0 ? 4.0 : 0.0),
            child: partItems[index],
          );
        },
        itemCount: partItems.length,
      ),
    );
  }
}
