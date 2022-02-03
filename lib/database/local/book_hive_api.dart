import 'package:flutter_toeic_quiz/database/local/test_hive_api.dart';
import 'package:flutter_toeic_quiz/models/book_detail/test_info.dart';
import 'package:flutter_toeic_quiz/models/book_detail/toeic_book.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/group_question.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_four.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_one.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_three.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_part/part_two.dart';
import 'package:flutter_toeic_quiz/models/test_detail/toeic_test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class BookHiveApi {
  static const String _bookNameBox = 'toeic_books';
  static final BookHiveApi instance = BookHiveApi._init();

  BookHiveApi._init();

  Future<void> openBox() async {
    await Hive.openBox(_bookNameBox);
  }

  Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(ToeicBookAdapter());
    Hive.registerAdapter(TestInfoAdapter());
    Hive.registerAdapter(ToeicTestAdapter());
    Hive.registerAdapter(PartOneAdapter());
    Hive.registerAdapter(PartTwoAdapter());
    Hive.registerAdapter(PartThreeAdapter());
    Hive.registerAdapter(PartFourAdapter());
    Hive.registerAdapter(GroupQuestionAdapter());
  }

  Future<void> addBookToDB(ToeicBook testBook) async {
    for (TestInfo testInfo in testBook.testInfos) {
      testInfo.boxId =
          "${testBook.title.replaceAll(' ', '_')}_${testInfo.title.replaceAll(' ', '_')}";
      //ex: ETS_2021_Summer_Practice_Test_01
    }
    await Hive.box(_bookNameBox).put(testBook.id, testBook);
  }

  void closeHive() {
    Hive.close();
  }

  List<ToeicBook> getAll() {
    List<ToeicBook> toeicBooks = [];
    final toeicBookBox = Hive.box(_bookNameBox);
    for (int i = 0; i < toeicBookBox.length; i++) {
      toeicBooks.add((toeicBookBox.getAt(i) as ToeicBook));
    }
    return toeicBooks;
  }

  ToeicBook? getByID(int id) {
    final toeicBookBox = Hive.box(_bookNameBox);
    return toeicBookBox.get(id);
  }
}
