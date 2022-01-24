import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/local/books_sqlite_api.dart';
import 'package:flutter_toeic_quiz/database/local/utils/book_sqlite.dart';
import 'package:flutter_toeic_quiz/screens/home/book_item.dart';
import 'package:flutter_toeic_quiz/screens/store/store_screen.dart';

final List<BookItem> bookItems = [];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool listItemIsUpdated = false;
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  Future<void> updateUI() async {
    List<BookSqlite> listBookItem =
        await BooksSqliteApi.instance.readAllDbBookItem();

    bookItems.clear();
    for (var bookItem in listBookItem) {
      bookItems.add(BookItem(bookInfo: bookItem));
    }
    setState(() {
      listItemIsUpdated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BOOKS',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => StoreScreen(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          SizedBox(
            width: kPaddingDefault,
          )
        ],
      ),
      body: listItemIsUpdated ? _buildList() : null,
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: bookItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: kPaddingDefault,
            right: kPaddingDefault,
            top: index == 0 ? kPaddingDefault / 2 : 0.0,
            bottom: index == bookItems.length - 1 ? kPaddingDefault / 2 : 0.0,
          ),
          child: bookItems[index],
        );
      },
    );
  }
}
