import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz/constants.dart';
import 'package:flutter_toeic_quiz/screens/firebase/firebase_screen.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool darkModeEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 4.0),
            SettingCard(
              children: [
                Text(
                  'Account',
                  style: kTextStyleTestItemH2,
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: Colors.yellow)),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Littlepea'), Text('View your profile')],
                    )
                  ],
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: Text('Purchase', style: kTextStyleSettingsH2)),
              ],
            ),
            SettingCard(
              children: [
                Text('User interface', style: kTextStyleSettingsH1),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dark mode', style: kTextStyleSettingsH2),
                        Text('Enable dark mode'),
                      ],
                    ),
                    Switch(
                      value: darkModeEnable,
                      onChanged: (value) {
                        setState(() {
                          darkModeEnable = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Application language', style: kTextStyleSettingsH2),
                      Text('English'),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Native language', style: kTextStyleSettingsH2),
                      Text('English'),
                    ],
                  ),
                ),
              ],
            ),
            SettingCard(
              children: [
                Text(
                  'Setting notification',
                  style: kTextStyleSettingsH2,
                ),
                SizedBox(height: 20.0),
                Text('Setting daily notification'),
                SizedBox(height: 10.0),
                Text('08:15 PM'),
              ],
            ),
            SettingCard(
              children: [
                Text(
                  'Community',
                  style: kTextStyleSettingsH1,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.star_rate_outlined),
                  label: Text('Rate us 5 star', style: kTextStyleSettingsH1),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.speaker_notes_rounded),
                  label: Text('Feedback', style: kTextStyleSettingsH1),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share_rounded),
                  label: Text('Share', style: kTextStyleSettingsH1),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FirebaseScreen(),
                          ));
                    },
                    icon: Icon(Icons.data_saver_off),
                    label: Text(
                      'Check firebase Storage (Admin only)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  SettingCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0.0, top: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
