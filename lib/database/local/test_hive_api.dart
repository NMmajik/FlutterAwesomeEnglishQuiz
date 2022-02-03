import 'package:flutter_toeic_quiz/models/test_detail/toeic_test.dart';
import 'package:hive/hive.dart';

class TestHiveApi {
  static const String _testNameBox = 'toeic_test_in_multi_books';
  static final TestHiveApi instance = TestHiveApi._init();
  TestHiveApi._init();

  Future<void> openBox() async {
    await Hive.openBox(_testNameBox);
  }

  Future<void> addTestToDB(
      {required ToeicTest toeicTest, required String testId}) async {
    await Hive.box(_testNameBox).put(testId, toeicTest);
  }

  ToeicTest getByID(String id) {
    final toeicBookBox = Hive.box(_testNameBox);
    ToeicTest test1 = toeicBookBox.get(id);
    //ToeicTest test2 = toeicBookBox.getAt(0);
    //ToeicTest test3 = toeicBookBox.getAt(1);

    return test1;
  }
}
