import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/local/utils/book_sqlite.dart';
import 'package:flutter_toeic_quiz/database/local/utils/test_sqlite.dart';
import 'package:flutter_toeic_quiz/screens/book/test_item.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key, required this.bookInfo}) : super(key: key);

  BookSqlite bookInfo;
  List<TestSqlite> listTest = [];

  void loadListTest() {
    List<dynamic> jsonTests = jsonDecode(bookInfo.test_detail_raw);
    listTest.clear();
    for (dynamic test in jsonTests) {
      listTest.add(TestSqlite.fromJson(test));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadListTest();
    final List<TestItem> testItems = [];
    for (TestSqlite item in listTest) {
      testItems.add(TestItem(
        resourceUrl: item.resource_url,
        title: item.title,
        questionNumber: item.question_number,
        dowloaded: item.downloaded!,
        size: item.size,
        onProgress: item.score != -1,
        actualScore: item.score!,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ETS 2020',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: index == testItems.length - 1 ? 8.0 : 0.0,
                      top: index == 0 ? 8.0 : 0.0),
                  child: testItems[index],
                );
              },
              itemCount: testItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
