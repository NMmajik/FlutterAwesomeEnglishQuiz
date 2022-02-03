import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/models/book_detail/test_info.dart';
import 'package:flutter_toeic_quiz/models/book_detail/toeic_book.dart';
import 'package:flutter_toeic_quiz/screens/book/test_item.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key, required this.toeicBook}) : super(key: key);

  ToeicBook toeicBook;

  @override
  Widget build(BuildContext context) {
    final List<TestItem> testItems = [];
    for (TestInfo item in toeicBook.testInfos) {
      testItems.add(TestItem(
        resourceUrl: item.resourceUrl,
        title: item.title,
        questionNumber: item.questionNumber,
        dowloaded: item.downloaded,
        //dowloaded: true,
        size: item.size,
        onProgress: item.score != -1,
        actualScore: item.score,
        testBoxId: item.boxId!,
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
