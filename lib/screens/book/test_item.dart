import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/screens/test/test_screen.dart';
import 'package:flutter_toeic_quiz/widgets/download_button.dart';
import 'package:flutter_toeic_quiz/widgets/outline_icon_button.dart';

const int maxScore = 990;

class TestItem extends StatefulWidget {
  TestItem({
    Key? key,
    this.dowloaded = true,
    this.onProgress = false,
    this.actualScore = 560,
    this.size = "",
    required this.resourceUrl,
    required this.questionNumber,
    required this.title,
  }) : super(key: key);

  bool dowloaded;
  bool onProgress;
  final String title;
  int actualScore;
  final int questionNumber;
  final String size;
  final String resourceUrl;

  @override
  State<TestItem> createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  late final DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    _downloadController = DataBaseDownloadController(
      resourceUrl: widget.resourceUrl,
      onOpenDownload: () => _openDownload(),
      downloadStatus: widget.dowloaded
          ? DownloadStatus.downloaded
          : DownloadStatus.notDownloaded,
    );
  }

  void _openDownload() {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => TestScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardRadiusDefault),
      ),
      elevation: kCardElevationDefaut,
      child: Padding(
        padding: const EdgeInsets.only(
            left: kPaddingDefaultDouble,
            right: kPaddingDefaultDouble,
            top: kPaddingDefaultDouble,
            bottom: kPaddingDefaultDouble),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.questionNumber} QUESTIONS - ${widget.size}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: kPaddingDefault),
                    Text(
                      '${widget.title}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  width: 76.0,
                  child: AnimatedBuilder(
                    animation: _downloadController,
                    builder: (BuildContext context, Widget? child) {
                      return DownloadButton(
                        status: _downloadController.downloadStatus,
                        downloadProgress: _downloadController.progress,
                        onCancel: _downloadController.stopDownload,
                        onDownload: _downloadController.startDownload,
                        onOpen: _downloadController.openDownload,
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: kPaddingDefault),
            if (widget.dowloaded && widget.onProgress)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.actualScore}/$maxScore',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: kPaddingDefault),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: kPaddingDefault),
                      child: LinearProgressIndicator(
                        value: widget.actualScore / maxScore,
                        color: kCircularProgressColor,
                        backgroundColor: Color(0xffb7e4c7),
                      ),
                    ),
                  )
                ],
              )
            else
              Row(
                children: [
                  Icon(Icons.help_outline_outlined, color: kIconColor),
                  SizedBox(width: kPaddingDefault),
                  Text(
                    'You have not studied this test',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(width: kPaddingDefault),
                ],
              )
          ],
        ),
      ),
    );
  }
}
