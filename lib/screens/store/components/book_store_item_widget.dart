import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/firebase/firebase_api.dart';
import 'package:flutter_toeic_quiz/database/local/books_sqlite_api.dart';
import 'package:flutter_toeic_quiz/database/local/utils/book_sqlite.dart';
import 'package:flutter_toeic_quiz/screens/store/book_detail_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookStoreItemWidget extends StatefulWidget {
  BookStoreItemWidget({Key? key, required this.bookInfo}) : super(key: key);

  BookSqlite bookInfo;
  bool bought = false;

  @override
  State<BookStoreItemWidget> createState() => _BookStoreItemWidgetState();
}

class _BookStoreItemWidgetState extends State<BookStoreItemWidget> {
  String bookCoverLink = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateImageCover();
  }

  void updateImageCover() async {
    print('fullUrl: bookCoverPathUrl ${widget.bookInfo.cover_url}');
    final fullUrl = await FirebaseApi.getDownloadUrl(widget.bookInfo.cover_url);
    print('tandq FirebaseApi get fullUrl done!');

    // check this item already in DB or not
    final bookInfoDb =
        await BooksSqliteApi.instance.readDbBookItem(widget.bookInfo.id);
    widget.bought = bookInfoDb == null ? false : true;

    print('tandq bookInfoDb check exist done');
    setState(() {
      bookCoverLink = fullUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('bookCoverPath: ${widget.bookInfo.cover_url}');
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BookDetailScreen(
                bookInfo: widget.bookInfo,
                bookCoverLink: bookCoverLink,
                bought: widget.bought,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(kPaddingDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(kPaddingDefault)),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Hero(
                    tag: 'Book_${widget.bookInfo.id}',
                    child: bookCoverLink == ''
                        ? SpinKitCircle(
                            color: Colors.blue,
                            size: 50.0,
                          )
                        : Image.network(
                            bookCoverLink,
                            fit: BoxFit.cover,
                            // loadingBuilder: (context, child, loadingProgress) {
                            //   if (loadingProgress == null) return child;
                            //   return child;
                            // },
                          )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kPaddingDefault),
                Text(
                  widget.bookInfo.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: kPaddingDefault),
                widget.bookInfo.price != 0
                    ? Text(
                        "\$price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Free',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
