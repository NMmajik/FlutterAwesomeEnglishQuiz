import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/database/firebase/firebase_api.dart';
import 'package:flutter_toeic_quiz/database/firebase/firebase_file.dart';

class TextReaderScreen extends StatefulWidget {
  TextReaderScreen({Key? key, required this.file}) : super(key: key);

  final FirebaseFile file;

  @override
  State<TextReaderScreen> createState() => _TextReaderScreenState();
}

class _TextReaderScreenState extends State<TextReaderScreen> {
  String utfData = '';
  getText() async {
    Uint8List? downloadedData = await widget.file.ref.getData();
    setState(() {
      utfData = utf8.decode(downloadedData!);
    });
  }

  @override
  Widget build(BuildContext context) {
    getText();
    print('file name is: ${widget.file.name}');
    return Scaffold(
      appBar: AppBar(
        title: Text('File detail: ${widget.file.name}'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseApi.downloadFile(widget.file.ref);
                final snackBar =
                    SnackBar(content: Text('Downloaded: ${widget.file.name}'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(Icons.download))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(child: Text(utfData)),
      )),
    );
  }
}
