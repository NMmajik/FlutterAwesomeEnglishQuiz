import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/local/books_sqlite_api.dart';
import 'package:flutter_toeic_quiz/database/local/utils/book_sqlite.dart';

class BookDetailScreen extends StatefulWidget {
  BookDetailScreen({
    Key? key,
    required this.bookInfo,
    required this.bookCoverLink,
    required this.bought,
  }) : super(key: key);

  BookSqlite bookInfo;
  String bookCoverLink;
  bool bought;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('AWESOME STORE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPaddingDefault),
        child: Column(
          children: [
            Card(
              elevation: kCardElevationDefaut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      child: Hero(
                        tag: 'Book_${widget.bookInfo.id}',
                        child: Image.network(
                          widget.bookCoverLink,
                          fit: BoxFit.cover,
                          width: width / 3.5,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.bookInfo.title}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '${widget.bookInfo.des}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '${widget.bookInfo.author}',
                        style: TextStyle(
                            color: Color(0xff2a9d8f),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text('Print List Price: 20.000 đ'),
                      Text('Price: ${widget.bookInfo.price} đ'),
                      Text('You Save: ${20000 - widget.bookInfo.price!} đ'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingDefault / 2),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (!widget.bought) {
                      // handle load data from here
                      buyTheBook();
                    }
                  },
                  child: !widget.bought
                      ? Text('BUY NOW WITH 1-CLICK',
                          style: TextStyle(
                            color: Colors.black,
                          ))
                      : Text('YOU ALREADY GET IT',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                  style: ButtonStyle(
                    backgroundColor: !widget.bought
                        ? MaterialStateProperty.all<Color>(Colors.orange)
                        : MaterialStateProperty.all<Color>(Colors.black12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buyTheBook() {
    BooksSqliteApi.instance.create(widget.bookInfo);
    //BooksSqliteApi.instance.createRaw(widget.rawJsonData);
    setState(() {
      widget.bought = true;
    });
  }
}
