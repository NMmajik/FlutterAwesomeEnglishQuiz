import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/database/firebase/firebase_api.dart';
import 'package:flutter_toeic_quiz/models/book_detail/toeic_book.dart';
import 'package:flutter_toeic_quiz/screens/store/components/book_store_item_widget.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late Future<String> dataFileItemList;

  @override
  void initState() {
    super.initState();
    dataFileItemList = FirebaseApi.getMainFileItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AWESOME STORE',
        ),
      ),
      body: FutureBuilder<String>(
        future: dataFileItemList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some thing error :('),
                );
              } else {
                print('tandq store_creen list book building');
                return _buildList(snapshot.data!);
              }
          }
        },
      ),
    );
  }

  Widget _buildList(String jsonString) {
    List<dynamic> json = jsonDecode(jsonString);
    //bookInfos.sort((a, b) => a['id'].compareTo(b['id']));

    return Padding(
      padding: const EdgeInsets.all(kPaddingDefault),
      child: GridView.builder(
          itemCount: json.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: kPaddingDefault,
              crossAxisSpacing: kPaddingDefault * 2),
          itemBuilder: (context, index) {
            final ToeicBook toeicBook = ToeicBook.fromMap(json[index]);
            return BookStoreItemWidget(
              toeicBook: toeicBook,
            );
          }),
    );
  }
}
