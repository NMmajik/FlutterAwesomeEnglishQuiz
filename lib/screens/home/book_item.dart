import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/models/book_detail/toeic_book.dart';
import 'package:flutter_toeic_quiz/screens/book/book_screen.dart';

class BookItem extends StatelessWidget {
  BookItem({
    Key? key,
    required this.toeicBook,
  }) : super(key: key);

  ToeicBook toeicBook;
  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BookScreen(toeicBook: toeicBook),
            ));
      },
      child: Container(
        height: 150,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardRadiusDefault),
              ),
              elevation: kCardElevationDefaut,
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(width: kPaddingDefault),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.all(
                          //       Radius.circular(kCardRadiusDefault / 2)),
                          //   child: Image.asset(
                          //     'assets/images/ets_book_cover.png',
                          //     fit: BoxFit.cover,
                          //     width: 80.0,
                          //     height: 100.0,
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 130.0),
                            child: Container(
                              height: 100.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${toeicBook.title}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text('${toeicBook.des}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Text('5% 887 B',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Toeic practice book',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(kCardRadiusDefault)),
                child: Image.asset(
                  'assets/images/ets_book_cover.png',
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 120.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
